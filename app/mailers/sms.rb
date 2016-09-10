class Sms < ActionSmser::Base

  def scorer_weekly(to, from, newscores, refused)
    str = "New Score: #{newscores} \nRefused: #{refused}"
    sms(:to => to, :from => from, :body => str)
  end

  def validator_weekly(to, from, scored, rescored)
    str = "Scored: #{scored} \nRescored: #{rescored}"
    sms(:to => to, :from => from, :body => str)
  end

end