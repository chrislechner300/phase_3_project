class Beer < ApplicationRecord

  validates :name, :brewery, presence: true
  belongs_to :style

  accepts_nested_attributes_for :style, reject_if: :all_blank

  def style_name
    self.style ? self.style.name : "Style Not Available"
  end

end
