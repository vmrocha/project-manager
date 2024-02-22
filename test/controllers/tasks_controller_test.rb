require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get project_tasks_url(@task.project)
    assert_response :success
  end

  test "should get new" do
    get new_project_task_url(@task.project)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post project_tasks_url(@task.project), params: { task: { completed: @task.completed, project_id: @task.project_id, title: @task.title } }
    end

    assert_redirected_to project_url(Task.last.project)
  end

  test "should show task" do
    get project_task_url(@task.project_id, @task.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_task_url(@task.project_id, @task.id)
    assert_response :success
  end

  test "should update task" do
    patch project_task_url(@task.project_id, @task.id), params: { task: { completed: @task.completed, project_id: @task.project_id, title: @task.title } }
    assert_redirected_to project_url(@task.project)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete project_task_url(@task.project_id, @task.id)
    end

    assert_redirected_to project_url(@task.project)
  end
end
