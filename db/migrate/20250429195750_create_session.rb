class CreateSession < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true
      t.integer :duration_seconds
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
