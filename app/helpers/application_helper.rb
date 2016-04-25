module ApplicationHelper

  def curr_page
    "#{params[:controller]}-#{params[:action]}"
  end

  def relative_date(date)
    "#{time_ago_in_words(date)} atrás"
  end
end
