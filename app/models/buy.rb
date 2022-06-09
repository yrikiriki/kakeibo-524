class Buy < ApplicationRecord
  with_options presence: true do
    validates :category_id,      numericality: { other_than: 1 }
    validates :item_name
    validates :price
  end
  belongs_to :user
  belongs_to :record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
