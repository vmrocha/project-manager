module ProjectsHelper
  def progress_bar(project)
    display_text = "#{(project.completion_ratio * 100).round}%"
    color = project.completion_ratio < 1 ? "is-warning" : "is-success"
    tag.progress(
      display_text,
      id: dom_id(project, :progress),
      value: project.tasks.completed.count,
      max: project.tasks.count,
      class: "progress #{color}"
    )
  end
end
