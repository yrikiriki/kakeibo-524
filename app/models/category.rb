class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: '--'},
      {id: 2, name: '食費'}, {id: 3, name: '家電'}, {id: 4, name: '日用品'},
      {id: 5, name: '衣服'}, {id: 6, name: '交通費'}, {id: 7, name: '固定費'},
      {id: 8, name: '趣味'}
  ]

  include ActiveHash::Associations
  has_many :buys
  has_many :posts
  has_many :users
end