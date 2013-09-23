module ApplicationHelper
    def admin?
        session[:adminkey] == "password"
    end

	def time_delta time
		if time < Time.now
			distance_of_time_in_words_to_now(time) + " ago"
		else
			distance_of_time_in_words_to_now(time) + " from now"
		end
	end

	def markdown(text)
		sanitize(BlueCloth::new(text).to_html)
	end

	def nice_date d
		d.strftime("%A, %B %d, %Y")
  end

  def nice_datetime d
		d.strftime("%I:%M %p %m-%d-%Y")
  end

  def ok_icon
      '<i class="icon-ok-sign" style="color: #1b1;"></i>'.html_safe
  end

  def unknown_icon
      '<i class="icon-question-sign" style="color: #11c;"></i>'.html_safe
  end

  def maybe_icon
      '<i class="icon-question-sign" style="color: #cc1;"></i>'.html_safe
  end

  def down_icon
      '<i class="icon-remove-sign" style="color: #c11;"></i>'.html_safe
  end

  def service_icon status, add="3x"
     ( '<span class="icon-' + add + '">' + case status
    when 1
        ok_icon
    when 2
        maybe_icon
    when 3
        down_icon
    else
        unknown_icon
    end + '</span>').html_safe

  end
end
