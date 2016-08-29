json.full_score_count Managers::Standard.by_department(params[:department]).by_full_score.count

json.improvable_count Managers::Standard.by_department(params[:department]).by_improvable.count

json.faild_score_count Managers::Standard.by_department(params[:department]).by_faild_score.count
