class Beer < ApplicationRecord

  belongs_to :user
  belongs_to :style

  validates :name, :brewery, presence: true

  accepts_nested_attributes_for :style, reject_if: :all_blank

  def style_name
    self.style ? self.style.name : "Style Not Available"
  end

  def self.latest_beers
    Beer.order(created_at: :desc).limit(5)
  end

end
