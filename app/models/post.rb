class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :text
    validates :store_name
    validates :category_id, numericality: { other_than: 1 }
  end
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
