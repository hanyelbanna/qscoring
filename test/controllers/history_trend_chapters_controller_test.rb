require 'test_helper'

class HistoryTrendChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_trend_chapter = history_trend_chapters(:one)
  end

  test "should get index" do
    get history_trend_chapters_url
    assert_response :success
  end

  test "should get new" do
    get new_history_trend_chapter_url
    assert_response :success
  end

  test "should create history_trend_chapter" do
    assert_difference('HistoryTrendChapter.count') do
      post history_trend_chapters_url, params: { history_trend_chapter: { chapter_id: @history_trend_chapter.chapter_id, score: @history_trend_chapter.score } }
    end

    assert_redirected_to history_trend_chapter_url(HistoryTrendChapter.last)
  end

  test "should show history_trend_chapter" do
    get history_trend_chapter_url(@history_trend_chapter)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_trend_chapter_url(@history_trend_chapter)
    assert_response :success
  end

  test "should update history_trend_chapter" do
    patch history_trend_chapter_url(@history_trend_chapter), params: { history_trend_chapter: { chapter_id: @history_trend_chapter.chapter_id, score: @history_trend_chapter.score } }
    assert_redirected_to history_trend_chapter_url(@history_trend_chapter)
  end

  test "should destroy history_trend_chapter" do
    assert_difference('HistoryTrendChapter.count', -1) do
      delete history_trend_chapter_url(@history_trend_chapter)
    end

    assert_redirected_to history_trend_chapters_url
  end
end
