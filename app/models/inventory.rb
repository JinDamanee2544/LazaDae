class Inventory < ApplicationRecord
  has_one :user , class_name: "user"
  has_one :item
  has_one :seller , class_name: "user"
end
