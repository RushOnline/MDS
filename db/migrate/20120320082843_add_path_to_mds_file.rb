class AddPathToMdsFile < ActiveRecord::Migration
  def change
    add_column :mds_files, :path, :string

  end
end
