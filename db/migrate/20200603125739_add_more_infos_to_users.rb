class AddMoreInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    #on ajoute des infos de base que le user peut rentrer, dont sa date de naissance qui servira a calculer son age.
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :dob, :date
    add_column :users, :address, :string
    add_column :users, :postcode, :string

  end
end
