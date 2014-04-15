class Sale < ActiveRecord::Base
  attr_accessible :condition, :photo, :price, :book_id, :charity
  has_and_belongs_to_many :books
  has_and_belongs_to_many :users

  validates(:condition, presence: true)
  validates(:price, presence: true)
end