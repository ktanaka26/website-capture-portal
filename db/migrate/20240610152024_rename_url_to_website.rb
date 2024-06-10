class RenameUrlToWebsite < ActiveRecord::Migration[7.0]
  def change
    rename_table :urls, :websites
  end
end
