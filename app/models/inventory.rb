class Inventory < ApplicationRecord
  belongs_to  :user , class_name: "User"
  belongs_to  :item , class_name: "Item"
  belongs_to  :seller , class_name: "User"
end
