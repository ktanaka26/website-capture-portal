class CreateScreenshots < ActiveRecord::Migration[7.0]
  def change
    create_table :screenshots do |t|
      t.references :url, null: false, foreign_key: true
      t.string :file_path

      t.timestamps
    end
  end
end
