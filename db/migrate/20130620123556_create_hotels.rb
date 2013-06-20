class CreateHotels < ActiveRecord::Migration
  def change
  	create_table :hotels do |t|
  		t.string   :name
  		t.string   :location
  		t.integer  :rating
  		t.text     :description
  		t.text     :image_url
  		t.timestamps
  	end
  end
end
