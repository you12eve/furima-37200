class Item < ApplicationRecord
  validates :title, presence: true
  validates :discription, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :source_id, presence: true
  validates :scheduled_day_id, presence: true


  belongs_to :user
  #has_one :purchase
end
