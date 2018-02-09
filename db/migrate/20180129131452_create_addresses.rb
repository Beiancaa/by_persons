class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :person_id, index: true
      t.string :city
      t.string :street
      t.string :zip_code

      t.timestamps
    end
  end
end
