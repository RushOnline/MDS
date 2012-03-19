class CreateMdsFiles < ActiveRecord::Migration
  def change
    create_table :mds_files do |t|
      t.integer :author_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
