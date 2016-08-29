json.chapter_applicable_count Managers::Standard.by_chapter(params[:chapter]).count


json.chapter_bold_count Managers::Standard.by_chapter(params[:chapter]).by_bold.count

json.chapter_bold_fall_count Managers::Standard.by_chapter(params[:chapter]).by_fall_bold.count


json.chapter_not_scored_count Managers::Standard.by_chapter(params[:chapter]).by_not_scored.count

json.chapter_not_validated_count Managers::Standard.by_chapter(params[:chapter]).by_not_validated.count

json.chapter_refused_count Managers::Standard.by_chapter(params[:chapter]).by_refused.count

json.chapter_re_scored_count Managers::Standard.by_chapter(params[:chapter]).by_re_scored.count

json.chapter_approved_count Managers::Standard.by_chapter(params[:chapter]).by_approved.count


json.chapter_full_score_count Managers::Standard.by_chapter(params[:chapter]).by_full_score.count

json.chapter_improvable_count Managers::Standard.by_chapter(params[:chapter]).by_improvable.count

json.chapter_faild_score_count Managers::Standard.by_chapter(params[:chapter]).by_faild_score.count
