module ProjectsHelper
  def progress_bar(project)
    display_text = "#{project.completion_ratio}%"
    color = project.completion_ratio < 1 ? "is-warning" : "is-success"
    tag.progress(
      display_text,
      value: project.tasks.completed.count,
      max: project.tasks.count,
      class: "progress #{color}"
    )
  end
end
