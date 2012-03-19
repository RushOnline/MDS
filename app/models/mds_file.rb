class MdsFile < ActiveRecord::Base
    belongs_to :author

    validates :title, :length => { :maximum => 250 }
end
