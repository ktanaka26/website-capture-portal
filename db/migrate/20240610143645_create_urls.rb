class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :address
      t.integer :status
      t.datetime :last_accessed_at

      t.timestamps
    end
  end
end
