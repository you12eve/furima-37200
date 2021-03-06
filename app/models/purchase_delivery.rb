class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id,:post_address, :source_id, :municipality, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :token

    validates :post_address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :source_id,    numericality: { other_than: 1, message: "を選択してください" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_address: post_address, source_id: source_id, municipality: municipality, 
                    address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end