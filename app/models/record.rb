class Record < ApplicationRecord
  has_many :buys
  belongs_to :user
end
