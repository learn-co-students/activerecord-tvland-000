class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    characters.reduce("") do |a, e|
	    #binding.pry
      a << "#{e.name} - #{e.show.name}\n"
	  end
  end  
end