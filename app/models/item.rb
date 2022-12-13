class Item < ApplicationRecord
    
    has_many :markets
    has_many :inventories 

    has_one_attached :picture do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
end
