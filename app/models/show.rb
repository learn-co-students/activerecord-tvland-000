class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, :through => :characters
  belongs_to :network

  def build_network(network_hash)
    self.network = Network.create(network_hash)
  end
end
