class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :description

      t.timestamps
    end
  end
end
