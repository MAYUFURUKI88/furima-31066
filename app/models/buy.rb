class Buy
  include ActiveModel::Model
  attr_accessor :user_item_id, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    @user_item = UserItem.create!(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, user_item_id: @user_item.id)
  end
end
