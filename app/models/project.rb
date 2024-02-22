class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  broadcasts_refreshes

  def completed?
    tasks.pending.none?
  end

  def completion_ratio
    return 0 if tasks.count.zero?

    tasks.completed.count.to_f / tasks.count
  end
end
