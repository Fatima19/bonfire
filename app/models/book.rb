class Book < ActiveRecord::Base
  attr_accessible :author, :description, :edition, :isbn, :name, :photo, :retail_price
  has_and_belongs_to_many :sales

  validates(:isbn, presence: true, :uniqueness => true)
  validates(:name, presence: true)
  validates(:retail_price, presence: true)
  validates(:description, presence: true)
end
