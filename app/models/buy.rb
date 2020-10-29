class Buy
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number, format:{with: /\A\d{10}$|^\d{11}\z/}
  end
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
    user = User.create
    item = Item.create
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number)
    UserItem.create(user_id: user.id, item_id: item.id)
  end
end