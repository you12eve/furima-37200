class Category < ActiveHash::Base
  self.data = [
    { id: 1,name: '--' },

  ]

  include ActiveHash::Asociations
  has_many :items

end