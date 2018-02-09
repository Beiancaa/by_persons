class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :user_id, index: true
      t.string :name
      t.boolean :active, default: true
      t.date :birth_day
      t.string :phone_number

      t.timestamps
    end
  end
end
