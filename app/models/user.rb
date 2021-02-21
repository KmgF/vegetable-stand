class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stands
  has_many :vegetables

  with_options presence: true do
    validates :nickname
    validates :postal_number
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
  end

  with_options format: {with:/\A[ｧ-ﾝﾞﾟ]+\z/,message:"カタカナのみ使用可能です"} do
    validates :first_name_kana
    validates :family_name_kana
  end

  validates :postal_number, format: {with: /\A\d{3}[-]\d{4}\z/,message: "ハイフンが必要です"}


end
