class RenameColumnUrlIdFromWebsiteIdInScreenshots < ActiveRecord::Migration[7.0]
  def change
    rename_column :screenshots, :url_id, :website_id
    add_foreign_key :screenshots, :websites, column: :website_id
  end
end
