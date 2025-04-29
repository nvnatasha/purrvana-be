class CreateUserCat < ActiveRecord::Migration[7.2]
  def change
    create_table :user_cats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true
      t.integer :times_used

      t.timestamps
    end
  end
end
