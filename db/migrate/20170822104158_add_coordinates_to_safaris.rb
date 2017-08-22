class AddCoordinatesToSafaris < ActiveRecord::Migration[5.0]
  def change
    add_column :safaris, :latitude, :float
    add_column :safaris, :longitude, :float
  end
end
