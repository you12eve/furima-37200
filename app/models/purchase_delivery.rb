class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :price, :token, :item_id, :user_id,:post_address, :source_id, :municipality, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :price
    validates :token

    validates :post_address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :source_id,    numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :address,      format: { with: /\A[-ぁ-んァ-ヶ一-龥々ー0-9]+\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end

  def save
    purchase = Purchase.create(price: price, token: token, user_id: user_id, item_id: item_id)
    Delivery.create(post_address: post_address, source_id: source_id, municipality: municipality, 
                    address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end