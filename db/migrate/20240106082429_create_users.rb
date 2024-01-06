class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :ip_address, index: true, unique: true

      t.timestamps
    end
  end
end
