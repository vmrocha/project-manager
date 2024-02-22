class Task < ApplicationRecord
  belongs_to :project, touch: true

  validates :title, presence: true

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
end
