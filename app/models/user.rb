class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,presence:true
         validates :prefecture_id,presence:true,numericality: { other_than: 1 }
         validates :city,presence:true

         has_many :buys
         has_many :posts
         has_many :badgets
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :category
end
