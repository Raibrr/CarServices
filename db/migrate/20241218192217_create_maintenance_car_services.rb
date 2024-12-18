class CreateMaintenanceCarServices < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_car_services do |t|
      t.belongs_to :car, null: false, foreign_key: true
      t.string :description, null: false
      t.integer :status
      t.date :date, null: false

      t.timestamps
    end
  end
end
