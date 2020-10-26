class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_fee_id
    validates :category_id
    validates :delivery_day_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :image
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
