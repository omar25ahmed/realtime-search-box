class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: true
      t.string :query, index: true

      t.timestamps
    end

    add_index :searches, [:user_id, :updated_at]
  end
end
