class RenameColumnInSafaris < ActiveRecord::Migration[5.0]
  def change
    rename_column :safaris, :location, :address
  end
end
