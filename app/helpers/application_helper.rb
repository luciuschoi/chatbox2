require 'emoji'

module ApplicationHelper
  def time_ago( input_time )
    timeago_tag input_time, :nojs => true, :limit => 30.days.ago, class: 'timeago', lang: I18n.locale
  end
end
