module ApplicationHelper
  def time_ago( input_time )
    timeago_tag input_time, :nojs => true, :limit => 30.days.ago, class: 'timeago', lang: I18n.locale
  end

  # def time_ago(time, options = { })
  #   options[:class] ||= "timeago"
  #   content_tag(:time, time.to_s, options.merge(datetime: time.getutc.iso8601)) if time
  # end
end
