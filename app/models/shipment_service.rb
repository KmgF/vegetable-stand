class ShipmentService < ActiveHash::Base

  self.data=[
    {id: 1,name:'--'},
    {id: 2,name:'配送不可'},
    {id: 3,name:'配送可能'}
  ]

  include ActiveHash::Associations
    has_many :vegetables
    
end
