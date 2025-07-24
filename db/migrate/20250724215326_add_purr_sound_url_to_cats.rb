class AddPurrSoundUrlToCats < ActiveRecord::Migration[7.2]
  def change
    add_column :cats, :purr_sound_url, :string
  end
end
