json.full_score_count Managers::Standard.by_chapter(params[:chapter]).by_full_score.count

json.improvable_count Managers::Standard.by_chapter(params[:chapter]).by_improvable.count

json.faild_score_count Managers::Standard.by_chapter(params[:chapter]).by_faild_score.count
