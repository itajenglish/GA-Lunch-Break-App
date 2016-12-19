class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
<<<<<<< HEAD
      t.string :address
=======
>>>>>>> 16da0f1f833fa139ada59ba68484a8f69444a3af
      t.string :latitude
      t.string :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
