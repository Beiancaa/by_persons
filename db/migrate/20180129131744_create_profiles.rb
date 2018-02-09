class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :person_id, index: true
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
