class Vegetable < ApplicationRecord
  belongs_to :user
  belongs_to :stand
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :shipment_service
    belongs_to :delivery_fee

  with_options presence: true do
    validates :category
    validates :image
    validates :amount
    validates :price
    validates :message
    validates :shipment_service
  end

validates :category, length: {maximum:50}

with_options length: {maximum: 500} do
  validates :message
  validates :quality_description
  validates :important_notice
end

validates :shipment_service_id, numericality:{ other_than:1, message: '配送できるかどうか選択してください'}
validates :delivery_fee_id, numericality:{other_than:1, message: '配達可能の場合、配送料の負担を選んでください'}, if: :shipment_service_need?

private
def shipment_service_need?
  shipment_service_id == 3
end

end
