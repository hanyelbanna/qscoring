desc "This task is called by the Heroku scheduler add-on"

task history: :environment do

	ex_standards = Managers::Standard.where('review_date <= now()::date')
	ex_standards.each do |ex_standard|
	  #copy data to new history
	    new_history = Managers::HistoryScore.new
	    new_history[:standard_id] = ex_standard[:id]
	    new_history[:score] = ex_standard[:score_for_avg]
	    new_history[:scorer_note] = ex_standard[:scorer_note]
	    new_history[:validator_note] = ex_standard[:validator_note]
	    new_history[:status] = ex_standard[:status]
	    new_history[:user_id] = ex_standard[:user_id]
	    new_history[:validator_id] = ex_standard[:validator_id]
	    new_history.save

	  # get freq days
	  freq_days = Managers::Frequency.find(ex_standard.frequency_id).days

	  # update sub data
	    ex_standard[:score] = nil
	    ex_standard[:scorer_note] = nil
	    ex_standard[:validator_note] = nil
	    ex_standard[:status] = 0
	    ex_standard[:review_date] = Date.today + freq_days
	    ex_standard.save

	end

	puts "done by Hany - history score."

end




task weekly_history_trends: :environment do

	#All weekly score
	avg_standards = Managers::Standard.score_average
    new_history = Managers::HistoryTrend.new
    new_history[:score] = avg_standards
    new_history.save

    #Chapters weekly score
	ch_standards = Managers::Standard.chapters_group_average_id
	ch_standards.each do |ch_standard|
	  #copy data to new history
	    new_chapter_history = Managers::HistoryTrendChapter.new
	    new_chapter_history[:chapter_id] = ch_standard[0]
	    new_chapter_history[:score] = ch_standard[1]
	    new_chapter_history.save
	end

	#Departments weekly score
	dp_standards = Managers::Standard.departments_group_average_id
	dp_standards.each do |dp_standard|
	  #copy data to new history
	    new_department_history = Managers::HistoryTrendDepartment.new
	    new_department_history[:department_id] = dp_standard[0]
	    new_department_history[:score] = dp_standard[1]
	    new_department_history.save
	end


	puts "done by Hany - weekly history trend."

end




task weekly_emails: :environment do

	Managers::User.all.each do |user_row|

		if user_row.standards.any?
			UserMailer.user_weekly_tasks(user_row).deliver

			new_scores = Managers::Standard.where(user_id: user_row.id).where(status: 0).order(:user_id).count
			refuseds = Managers::Standard.where(user_id: user_row.id).where(status: 2).order(:user_id).count
			Sms.scorer_weekly(user_row.mobile, '966501011951', new_scores, refuseds).deliver
		end

		if user_row.standard_validators.any?
			UserMailer.validator_weekly_tasks(user_row).deliver

			scored = Managers::Standard.where(validator_id: user_row.id).where(status: 1).order(:validator_id).count
			rescored = Managers::Standard.where(validator_id: user_row.id).where(status: 3).order(:validator_id).count
			Sms.validator_weekly(user_row.mobile, '966501011951', scored, rescored).deliver
		end

		if user_row.try(:type) == "Managers::Manager"
			UserMailer.manager_weekly_tasks(user_row).deliver
		end
	end

	puts "done by Hany - weekly emails."

end