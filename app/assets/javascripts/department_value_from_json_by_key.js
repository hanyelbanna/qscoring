function department_value_from_json_by_key(data_url, waiting_time) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#department_applicable_count_id').html(result.department_applicable_count);

        $('#department_bold_count_id').html(result.department_bold_count);

        $('#department_bold_fall_count_id').html(result.department_bold_fall_count);

        $('#department_not_scored_count_id').html(result.department_not_scored_count);

        $('#department_not_validated_count_id').html(result.department_not_validated_count);

        $('#department_refused_count_id').html(result.department_refused_count);

        $('#department_re_scored_count_id').html(result.department_re_scored_count);

        $('#department_approved_count_id').html(result.department_approved_count);

        $('#department_faild_score_count_id').html(result.department_faild_score_count);

        $('#department_improvable_count_id').html(result.department_improvable_count);

        $('#department_full_score_count_id').html(result.department_full_score_count);

      }
    });

  setInterval(function() {
    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#department_applicable_count_id').html(result.department_applicable_count);

        $('#department_bold_count_id').html(result.department_bold_count);

        $('#department_bold_fall_count_id').html(result.department_bold_fall_count);

        $('#department_not_scored_count_id').html(result.department_not_scored_count);

        $('#department_not_validated_count_id').html(result.department_not_validated_count);

        $('#department_refused_count_id').html(result.department_refused_count);

        $('#department_re_scored_count_id').html(result.department_re_scored_count);

        $('#department_approved_count_id').html(result.department_approved_count);

        $('#department_faild_score_count_id').html(result.department_faild_score_count);

        $('#department_improvable_count_id').html(result.department_improvable_count);

        $('#department_full_score_count_id').html(result.department_full_score_count);

      }
    });
  }, waiting_time);
}