class AddPhotosToSafari < ActiveRecord::Migration[5.0]
  def change
    add_column :safaris, :photos, :jsonb
  end
end
