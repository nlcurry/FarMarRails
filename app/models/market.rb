class Market < ActiveRecord::Base
  has_many :vendors

  # Market must have a name, but the name may not necessarily be unique
  validates :name, presence: true

  # must have address data
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  # zip must be numerical, 5 digits in length
  validates :zip, length: { maximum: 10 }


end
