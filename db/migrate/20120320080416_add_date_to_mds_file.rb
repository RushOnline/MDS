class AddDateToMdsFile < ActiveRecord::Migration
  def change
    add_column :mds_files, :date, :date

  end
end
