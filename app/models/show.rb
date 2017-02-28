class Show < ActiveRecord::Base

  has_one :network
  has_many :characters
  has_many :actors, through: :characters

end