class Actor < ActiveRecord::Base
  belongs_to :show
  has_many :characters
  has_many :shows

  def full_name
    return "#{first_name} #{last_name}"
  end

  def list_roles
    total_string = ""

    characters.each do |character|
      total_string += "#{character.name} in the show #{character.show.name}\n"
    end
    return total_string
  end

end