class Style < ApplicationRecord
  
  has_many :beers
  has_many :users, through: :beers
  
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :beers, reject_if: :all_blank
end
