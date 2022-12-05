class User < ApplicationRecord
    has_secure_password

    has_many :markets
    has_many :inventories
end
