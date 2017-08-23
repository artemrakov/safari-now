class CreateSafariImages < ActiveRecord::Migration[5.0]
  def change
    create_table :safari_images do |t|

      t.timestamps
    end
  end
end
