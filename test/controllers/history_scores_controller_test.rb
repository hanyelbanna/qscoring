require 'test_helper'

class HistoryScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_score = history_scores(:one)
  end

  test "should get index" do
    get history_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_history_score_url
    assert_response :success
  end

  test "should create history_score" do
    assert_difference('HistoryScore.count') do
      post history_scores_url, params: { history_score: { score: @history_score.score, scorer_note: @history_score.scorer_note, standard_id: @history_score.standard_id, status: @history_score.status, validator_note: @history_score.validator_note } }
    end

    assert_redirected_to history_score_url(HistoryScore.last)
  end

  test "should show history_score" do
    get history_score_url(@history_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_score_url(@history_score)
    assert_response :success
  end

  test "should update history_score" do
    patch history_score_url(@history_score), params: { history_score: { score: @history_score.score, scorer_note: @history_score.scorer_note, standard_id: @history_score.standard_id, status: @history_score.status, validator_note: @history_score.validator_note } }
    assert_redirected_to history_score_url(@history_score)
  end

  test "should destroy history_score" do
    assert_difference('HistoryScore.count', -1) do
      delete history_score_url(@history_score)
    end

    assert_redirected_to history_scores_url
  end
end
