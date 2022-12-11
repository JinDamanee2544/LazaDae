class Inventory < ApplicationRecord
  belongs_to  :user , class_name: "user"
  belongs_to  :item 
  belongs_to  :seller , class_name: "user"
end
