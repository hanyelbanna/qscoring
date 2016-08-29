function value_from_json_by_key(data_url, waiting_time) {

    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#applicable_count_id').html(result.applicable_count);

        $('#bold_count_id').html(result.bold_count);

        $('#bold_fall_count_id').html(result.bold_fall_count);

        $('#action_plan_count_id').html(result.action_plan_count);

        $('#task_count_id').html(result.task_count);

        $('#task_after_due_count_id').html(result.task_after_due_count);

        $('#not_scored_count_id').html(result.not_scored_count);

        $('#not_validated_count_id').html(result.not_validated_count);

        $('#refused_count_id').html(result.refused_count);

        $('#re_scored_count_id').html(result.re_scored_count);

        $('#approved_count_id').html(result.approved_count);

        $('#faild_score_count_id').html(result.faild_score_count);

        $('#improvable_count_id').html(result.improvable_count);

        $('#full_score_count_id').html(result.full_score_count);

      }
    });

  setInterval(function() {
    $.ajax({
      url: data_url,
      dataType: 'json',
      success: function(result){

        $('#applicable_count_id').html(result.applicable_count);

        $('#bold_count_id').html(result.bold_count);

        $('#bold_fall_count_id').html(result.bold_fall_count);

        $('#action_plan_count_id').html(result.action_plan_count);

        $('#task_count_id').html(result.task_count);

        $('#task_after_due_count_id').html(result.task_after_due_count);

        $('#not_scored_count_id').html(result.not_scored_count);

        $('#not_validated_count_id').html(result.not_validated_count);

        $('#refused_count_id').html(result.refused_count);

        $('#re_scored_count_id').html(result.re_scored_count);

        $('#approved_count_id').html(result.approved_count);

        $('#faild_score_count_id').html(result.faild_score_count);

        $('#improvable_count_id').html(result.improvable_count);

        $('#full_score_count_id').html(result.full_score_count);

      }
    });
  }, waiting_time);
}