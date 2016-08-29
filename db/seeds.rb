# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Managers::User.create!(first_name: "Hany", last_name: "Scorer", email: "scorer@test.com", mobile: "00966501011951", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 user has been created"

Managers::Validator.create!(first_name: "Hany", last_name: "Validator", email: "validator@test.com", mobile: "00966501011951", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 validator has been created"

Managers::Manager.create!(first_name: "Hany", last_name: "Manager", email: "manager@test.com", mobile: "00966501011951", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 validator has been created"

5.times do |chapter|
	Managers::Chapter.create!(name: "Chapter #{chapter + 1}", description: "Chapter Description #{chapter + 1}")
end
puts "5 Chapters have been created"

5.times do |department|
	Managers::Department.create!(name: "Department #{department + 1}", description: "Department Description #{department + 1}")
end
puts "5 Departments have been created"

5.times do |frequency|
	Managers::Frequency.create!(name: "Frequency #{frequency + 1}", description: "Frequency Description #{frequency + 1}", days: frequency)
end
puts "5 Frequencies have been created"



20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 1}", description: "Standard Description #{standard + 1}", chapter_id: 1, department_id: 1,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 0)
end
puts "20 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 20}", description: "Standard Description #{standard + 20}", chapter_id: 1, department_id: 1,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 1, score: 0)
end
puts "20 Standards have been created"


20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard +60}", description: "Standard Description #{standard + 60}", chapter_id: 2, department_id: 2,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 1, score: 2)
end
puts "20 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 80}", description: "Standard Description #{standard + 80}", chapter_id: 3, department_id: 3,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 2, score: 2, validator_note: "Please recheck")
end
puts "20 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 100}", description: "Standard Description #{standard + 100}", chapter_id: 4, department_id: 4,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 3, score: 1)
end
puts "20 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 1, department_id: 1,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 2, bold: true)
end
puts "20 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 2, department_id: 2,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 1)
end
puts "20 Standards have been created"

10.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 3, department_id: 3,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 2)
end
puts "10 Standards have been created"

10.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 3, department_id: 3,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 1)
end
puts "10 Standards have been created"

10.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 4, department_id: 4,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 1)
end
puts "10 Standards have been created"

10.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 120}", description: "Standard Description #{standard + 120}", chapter_id: 4, department_id: 4,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 0)
end
puts "10 Standards have been created"

20.times do |standard|
	Managers::Standard.create!(name: "Standard #{standard + 40}", description: "Standard Description #{standard + 40}", chapter_id: 5, department_id: 5,
	user_id: 1, validator_id: 2, frequency_id: 1, review_date: "1-1-2016", status: 4, score: 1)
end
puts "20 Standards have been created"



5.times do |action_plan|
	Managers::ActionPlan.create!(name: "Action Plan #{action_plan + 1}", description: "Action Plan Description #{action_plan + 1}")
end
puts "5 Action Plans have been created"

50.times do |task|
	Managers::Task.create!(name: "Task #{task + 1}", description: "Task Description #{task + 1}", user_id: 1, due_date: "1-1-2016", action_plan_id: 1)
end
puts "50 Action Plans have been created"



200.times do |history_score|
	Managers::HistoryScore.create!(standard_id: "#{history_score + 1}", user_id: 1, validator_id: 2, status: 4, score: 1, created_at: "1-1-2016")
end
puts "200 History Score have been created"


200.times do |history_score|
	Managers::HistoryScore.create!(standard_id: "#{history_score + 1}", user_id: 1, validator_id: 2, status: 4, score: 2, created_at: "1-2-2016")
end
puts "200 History Score have been created"

200.times do |history_score|
	Managers::HistoryScore.create!(standard_id: "#{history_score + 1}", user_id: 1, validator_id: 2, status: 4, score: 2, created_at: "1-3-2016")
end
puts "200 History Score have been created"



10.times do |history_trend|
	Managers::HistoryTrend.create!(score: 70 + history_trend, created_at: Time.now.to_date + history_trend.day - 20.day)
end
puts "10 History Trend have been created"

5.times do |history_trend_chapter|
	Managers::HistoryTrendChapter.create!(chapter_id: "#{history_trend_chapter + 1}", score: 50 + history_trend_chapter, created_at: Time.now.to_date + history_trend_chapter.day - 20.day)
end
puts "5 History Trend Chapter have been created"

5.times do |history_trend_chapter|
	Managers::HistoryTrendChapter.create!(chapter_id: "#{history_trend_chapter + 1}", score: 60 + history_trend_chapter, created_at: Time.now.to_date + history_trend_chapter.day - 20.day)
end
puts "5 History Trend Chapter have been created"

5.times do |history_trend_chapter|
	Managers::HistoryTrendChapter.create!(chapter_id: "#{history_trend_chapter + 1}", score: 70 + history_trend_chapter, created_at: Time.now.to_date + history_trend_chapter.day - 20.day)
end
puts "5 History Trend Chapter have been created"


5.times do |history_trend_department|
	Managers::HistoryTrendDepartment.create!(department_id: "#{history_trend_department + 1}", score: 50 + history_trend_department, created_at: Time.now.to_date + history_trend_department.day - 20.day)
end
puts "5 History Trend Department have been created"

5.times do |history_trend_department|
	Managers::HistoryTrendDepartment.create!(department_id: "#{history_trend_department + 1}", score: 60 + history_trend_department, created_at: Time.now.to_date + history_trend_department.day - 20.day)
end
puts "5 History Trend Department have been created"

5.times do |history_trend_department|
	Managers::HistoryTrendDepartment.create!(department_id: "#{history_trend_department + 1}", score: 70 + history_trend_department, created_at: Time.now.to_date + history_trend_department.day - 20.day)
end
puts "5 History Trend Department have been created"