class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :source
  belongs_to :scheduled_day

  validates :title,            presence: true
  validates :discription,      presence: true
  validates :price,            presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,      presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id,     presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :charge_id,        presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :source_id,        presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :scheduled_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :image,            presence: true

  has_one_attached :image
  belongs_to :user
  has_one :purchase
end
