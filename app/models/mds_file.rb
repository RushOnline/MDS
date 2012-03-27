class MdsFile < ActiveRecord::Base
#    attr_accessible :title, :path, :url

    belongs_to :author
    belongs_to :source

    validates :title, :length => { :maximum => 250 }
end
