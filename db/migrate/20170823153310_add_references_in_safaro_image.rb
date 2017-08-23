class AddReferencesInSafaroImage < ActiveRecord::Migration[5.0]
  def change
    add_reference :safari_images, :safari, foreign_key: true
  end
end
