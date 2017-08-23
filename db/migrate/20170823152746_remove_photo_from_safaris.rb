class RemovePhotoFromSafaris < ActiveRecord::Migration[5.0]
  def change
    remove_column :safaris, :photos, :jsonb
  end
end
