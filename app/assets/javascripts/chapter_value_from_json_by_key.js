function chapter_value_from_json_by_key(data_url, waiting_time) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#chapter_applicable_count_id').html(result.chapter_applicable_count);

        $('#chapter_bold_count_id').html(result.chapter_bold_count);

        $('#chapter_bold_fall_count_id').html(result.chapter_bold_fall_count);

        $('#chapter_not_scored_count_id').html(result.chapter_not_scored_count);

        $('#chapter_not_validated_count_id').html(result.chapter_not_validated_count);

        $('#chapter_refused_count_id').html(result.chapter_refused_count);

        $('#chapter_re_scored_count_id').html(result.chapter_re_scored_count);

        $('#chapter_approved_count_id').html(result.chapter_approved_count);

        $('#chapter_faild_score_count_id').html(result.chapter_faild_score_count);

        $('#chapter_improvable_count_id').html(result.chapter_improvable_count);

        $('#chapter_full_score_count_id').html(result.chapter_full_score_count);

      }
    });

  setInterval(function() {
    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#chapter_applicable_count_id').html(result.chapter_applicable_count);

        $('#chapter_bold_count_id').html(result.chapter_bold_count);

        $('#chapter_bold_fall_count_id').html(result.chapter_bold_fall_count);

        $('#chapter_not_scored_count_id').html(result.chapter_not_scored_count);

        $('#chapter_not_validated_count_id').html(result.chapter_not_validated_count);

        $('#chapter_refused_count_id').html(result.chapter_refused_count);

        $('#chapter_re_scored_count_id').html(result.chapter_re_scored_count);

        $('#chapter_approved_count_id').html(result.chapter_approved_count);

        $('#chapter_faild_score_count_id').html(result.chapter_faild_score_count);

        $('#chapter_improvable_count_id').html(result.chapter_improvable_count);

        $('#chapter_full_score_count_id').html(result.chapter_full_score_count);

      }
    });
  }, waiting_time);
}