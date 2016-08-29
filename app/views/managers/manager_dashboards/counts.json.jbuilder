json.applicable_count Managers::Standard.count

json.bold_count Managers::Standard.by_bold.count

json.bold_fall_count Managers::Standard.by_fall_bold.count


json.action_plan_count Managers::ActionPlan.by_not_closed.count

json.task_count Managers::Task.by_not_completed.count

json.task_after_due_count Managers::Task.by_not_completed.by_after_due.count


json.not_scored_count Managers::Standard.by_not_scored.count

json.not_validated_count Managers::Standard.by_not_validated.count

json.refused_count Managers::Standard.by_refused.count

json.re_scored_count Managers::Standard.by_re_scored.count

json.approved_count Managers::Standard.by_approved.count


json.full_score_count Managers::Standard.by_full_score.count

json.improvable_count Managers::Standard.by_improvable.count

json.faild_score_count Managers::Standard.by_faild_score.count
