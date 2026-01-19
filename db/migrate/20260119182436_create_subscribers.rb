class CreateSubscribers < ActiveRecord::Migration[7.2]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :subscribers, :email, unique: true
  end
end
