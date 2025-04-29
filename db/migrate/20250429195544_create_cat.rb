class CreateCat < ActiveRecord::Migration[7.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :mood
      t.string :purr_style
      t.string :img_url

      t.timestamps
    end
  end
end
