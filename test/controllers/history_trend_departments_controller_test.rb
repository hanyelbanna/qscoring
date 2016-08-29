require 'test_helper'

class HistoryTrendDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_trend_department = history_trend_departments(:one)
  end

  test "should get index" do
    get history_trend_departments_url
    assert_response :success
  end

  test "should get new" do
    get new_history_trend_department_url
    assert_response :success
  end

  test "should create history_trend_department" do
    assert_difference('HistoryTrendDepartment.count') do
      post history_trend_departments_url, params: { history_trend_department: { department_id: @history_trend_department.department_id, score: @history_trend_department.score } }
    end

    assert_redirected_to history_trend_department_url(HistoryTrendDepartment.last)
  end

  test "should show history_trend_department" do
    get history_trend_department_url(@history_trend_department)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_trend_department_url(@history_trend_department)
    assert_response :success
  end

  test "should update history_trend_department" do
    patch history_trend_department_url(@history_trend_department), params: { history_trend_department: { department_id: @history_trend_department.department_id, score: @history_trend_department.score } }
    assert_redirected_to history_trend_department_url(@history_trend_department)
  end

  test "should destroy history_trend_department" do
    assert_difference('HistoryTrendDepartment.count', -1) do
      delete history_trend_department_url(@history_trend_department)
    end

    assert_redirected_to history_trend_departments_url
  end
end
