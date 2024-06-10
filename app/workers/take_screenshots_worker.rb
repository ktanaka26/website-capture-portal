class TakeScreenshotsWorker
  include Sidekiq::Worker

  def perform
    Website.find_each do |website|
      ScreenshotJob.perform_later(website)
    end
  end
end
