class MdsFile < ActiveRecord::Base
    belongs_to :author
    belongs_to :source

    validates :title, :length => { :maximum => 250 }
end
