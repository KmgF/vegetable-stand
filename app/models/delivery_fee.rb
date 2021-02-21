class DeliveryFee < ActiveHash::Base

  self.data=[
    {id:1,name:'--'},
    {id:2,name:'出品者負担(価格に配送料が含まれている)'},
    {id:3,name:'購入者負担'}
  ]

  include ActiveHash::Associations
    has_many :vegetables

end
