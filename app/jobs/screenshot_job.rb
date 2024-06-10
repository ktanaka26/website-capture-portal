class ScreenshotJob < ApplicationJob
  queue_as :screenshots

  def perform(website)
    setting = Setting.first_or_create(interval: 60, retention: 10)

    begin
      # スクリーンショット取得のロジック
      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to website.address

      # 特定の要素が表示されるのを待つ (例: bodyタグ)
      wait = Selenium::WebDriver::Wait.new(timeout: 10)
      wait.until { driver.find_element(:tag_name, "body").displayed? }

      screenshot_dir = Rails.root.join('public', 'screenshots')
      FileUtils.mkdir_p(screenshot_dir) unless Dir.exist?(screenshot_dir)
      screenshot_path = screenshot_dir.join("#{website.id}_#{Time.now.to_i}.png").to_s
      driver.save_screenshot(screenshot_path)
      driver.quit

      Screenshot.create!(website: website, file_path: screenshot_path)
      website.update!(status: 200, last_accessed_at: Time.now)

      # 古いスクリーンショットの削除
      screenshots = website.screenshots.order(created_at: :desc)
      if screenshots.count > setting.retention
        screenshots.last.destroy
      end
    rescue => e
      website.update!(status: 500, last_accessed_at: Time.now)
    end
  end
end
