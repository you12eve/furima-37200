class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_kana, presence: true, format:{ with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  
  has_many :items
  has_many :purchases
end
