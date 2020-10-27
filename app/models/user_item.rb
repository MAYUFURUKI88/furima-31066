class UserItem < ApplicationRecord
has_one :address
belongs_to :user
belongs_to :item
has_one :user_item
end
