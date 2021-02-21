class Stand < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :vegetables, dependent: :destroy

  with_options presence: {message: "%{value} は入力必須です"} do
    validates :name
    validates :street_address
  end

  with_options length:{maximum: 50, message:"50文字以上だと登録できません"} do
     validates :name
     validates :street_address
  end


  
end
