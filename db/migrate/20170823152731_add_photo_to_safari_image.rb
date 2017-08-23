class AddPhotoToSafariImage < ActiveRecord::Migration[5.0]
  def change
    add_column :safari_images, :photo, :string
  end
end
