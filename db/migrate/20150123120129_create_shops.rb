class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :host
      t.string :token
      t.string :madmimi_api_key
      t.string :madmimi_email
      t.string :madmimi_list_name

      t.timestamps
    end
  end
end
