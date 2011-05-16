module ApplicationHelper

  def time_ago(time)
    if time == nil
      return 'not mentioned'
    end
    current = Time.now()
    passed = current - time
    if passed < 60
      return passed.to_s + ' seconds ago'
    elsif passed < 60 * 60
      return (( passed / 60 ).to_i).to_s + ' minutes ago'
    elsif passed < 60 * 60 * 24
      return (passed / (60 * 60)).to_i.to_s + ' hours ago'
    elsif passed < 60 * 60 * 24 * 30
      return (passed / (60 * 60 * 24)).to_i.to_s + ' days ago'
    elsif passed < 60 * 60 * 24 * 30 * 12
      return (passed / ( 60 * 60 * 24 * 30 )).to_i.to_s + ' months ago'
    else
      return (passed / (60 * 60 * 24 * 30 * 12)).to_i.to_s + ' years ago'
    end
  end
end
