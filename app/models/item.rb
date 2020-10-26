class Item < ApplicationRecord
  has_many :items
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  
  with_options numericality: { other_than: 1 } do
  validates :status_id
  validates :delivery_fee
  end
end
