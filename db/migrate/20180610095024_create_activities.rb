class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      
      t.string :name
      t.string :address
      t.string :phone
      t.string :intro
      t.string :url


      t.timestamps
    end
  end
end
