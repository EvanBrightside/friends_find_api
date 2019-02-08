class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :surname
      t.string   :sex
      t.integer  :age
      t.float    :latitude
      t.float    :longitude

      t.timestamps
    end
    add_index :users, %i[latitude longitude]
  end
end
