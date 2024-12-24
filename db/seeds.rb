# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
## Crea algunos autos (Car) si no existen
cars = Car.create([
  { plate_number: 'ABC-1234', model: 'Corolla', year: 2020 },
  { plate_number: 'DEF-5678', model: 'Focus', year: 2019 },
  { plate_number: 'GHI-9012', model: 'Cruze', year: 2018 },
  { plate_number: 'JKL-3456', model: 'Civic', year: 2021 }
])

# Crea servicios de mantenimiento (MaintenanceCarService)
MaintenanceCarService.create([
  { car_id: cars[0].id, description: 'Cambio de aceite', status: :completed, date: '2023-01-15' },
  { car_id: cars[0].id, description: 'Revisión de frenos', status: :completed, date: '2023-03-20' },
  { car_id: cars[1].id, description: 'Cambio de llantas', status: :pending, date: '2024-01-10' },
  { car_id: cars[1].id, description: 'Alineación y balanceo', status: :in_progress, date: '2024-02-05' },
  { car_id: cars[2].id, description: 'Cambio de batería', status: :completed, date: '2022-11-10' },
  { car_id: cars[2].id, description: 'Limpieza del sistema de aire', status: :pending, date: '2024-03-01' },
  { car_id: cars[3].id, description: 'Reemplazo de bujías', status: :in_progress, date: '2023-12-15' },
  { car_id: cars[3].id, description: 'Cambio de amortiguadores', status: :completed, date: '2023-08-10' },
  { car_id: cars[0].id, description: 'Revisión general', status: :completed, date: '2024-06-30' },
  { car_id: cars[1].id, description: 'Cambio de filtro de aire', status: :completed, date: '2023-10-05' }
])


User.create(email: "admin@admin.com", password: "123456789")
