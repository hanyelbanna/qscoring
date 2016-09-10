class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.weekly_tasks.subject
  #
  def user_weekly_tasks(user_row)
    @user_standards_newscore = user_row.standards.newscore
    @user_standards_refused = user_row.standards.refused

    mail to: user_row.email
  end

  def validator_weekly_tasks(user_row)
    @validator_standards_scored = user_row.standard_validators.scored
    @validator_standards_rescored = user_row.standard_validators.rescored

    mail to: user_row.email
  end

  def manager_weekly_tasks(user_row)
    @manager_standards_newscore = Managers::Standard.where(status: 0).order(:user_id).group(:user_id).count
    @manager_standards_refused = Managers::Standard.where(status: 2).order(:user_id).group(:user_id).count

    mail to: user_row.email
  end

end
