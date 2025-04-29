class CreateDailyWisdom < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_wisdoms do |t|
      t.text :quote

      t.timestamps
    end
  end
end
