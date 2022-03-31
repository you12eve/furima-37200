class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :Charge
    belongs_to :Source
    belongs_to :Scheduled_day


  validates :title,            presence: true
  validates :discription,      presence: true
  validates :price,            presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :charge_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :source_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :scheduled_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  has_one_attached :image
  belongs_to :user

  #has_one :purchase
end
