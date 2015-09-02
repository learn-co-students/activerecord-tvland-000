class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    characters.reduce("") do |str, ch|
	  str << "#{ch.name} - #{ch.show.name}\n"
	end
  end  
end