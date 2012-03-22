class Author < ActiveRecord::Base
    attr_accessible :name

    has_many :mds_file

    validates :name, :length => { :maximum => 140 }
end
