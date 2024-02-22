# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

COUNT_PROJECT = 30
COUNT_TASKS_PER_PROJECT = 20

COUNT_PROJECT.times do |i|
  project = Project.create!(name: "Project #{i + 1}")

  COUNT_TASKS_PER_PROJECT.times do |j|
    project.tasks.create!(title: "Task #{j + 1}", completed: [true, false].sample)
  end
end
