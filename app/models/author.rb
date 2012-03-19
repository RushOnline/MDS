class Author < ActiveRecord::Base
    has_many :mds_file

    validates :name, :length => { :maximum => 140 }
end
