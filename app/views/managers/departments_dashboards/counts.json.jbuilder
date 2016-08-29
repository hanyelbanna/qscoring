json.department_applicable_count Managers::Standard.by_department(params[:department]).count


json.department_bold_count Managers::Standard.by_department(params[:department]).by_bold.count

json.department_bold_fall_count Managers::Standard.by_department(params[:department]).by_fall_bold.count


json.department_not_scored_count Managers::Standard.by_department(params[:department]).by_not_scored.count

json.department_not_validated_count Managers::Standard.by_department(params[:department]).by_not_validated.count

json.department_refused_count Managers::Standard.by_department(params[:department]).by_refused.count

json.department_re_scored_count Managers::Standard.by_department(params[:department]).by_re_scored.count

json.department_approved_count Managers::Standard.by_department(params[:department]).by_approved.count


json.department_full_score_count Managers::Standard.by_department(params[:department]).by_full_score.count

json.department_improvable_count Managers::Standard.by_department(params[:department]).by_improvable.count

json.department_faild_score_count Managers::Standard.by_department(params[:department]).by_faild_score.count
