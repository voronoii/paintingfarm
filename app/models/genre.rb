class Genre < ActiveRecord::Base
    has_many :markets
end
