class MaintenanceCarService < ApplicationRecord
  belongs_to :car

  enum status: { pending: 0, in_progress: 1, completed: 2 }

  validates :description, :date, presence: true
end
