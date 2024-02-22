class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def completion_ratio
    return 0 if tasks.count.zero?

    tasks.completed.count.to_f / tasks.count
  end
end
