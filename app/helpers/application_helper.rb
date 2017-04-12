module ApplicationHelper
  def time_ago( input_time )
    timeago_tag input_time, :nojs => true, :limit => 30.days.ago, class: 'timeago', lang: I18n.locale
  end

  # def time_ago(time, options = { })
  #   options[:class] ||= "timeago"
  #   content_tag(:time, time.to_s, options.merge(datetime: time.getutc.iso8601)) if time
  # end

  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end

end
