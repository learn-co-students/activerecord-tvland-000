class AddBelongToShow < ActiveRecord::Migration

  def change
    add_column :shows, :network, :belong_to
  end 

end