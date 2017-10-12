class CreateModelsUsers < ActiveRecord::Migration
  def change
    create_table :models_users do |t|

      t.timestamps null: false
    end
  end
end
