class AddSourceIdToMdsFile < ActiveRecord::Migration
  def change
    add_column :mds_files, :source_id, :integer

  end
end
