module ApplicationHelper

  #Returns the full title on page
  def full_title(page_title)
    base_title = "Autoadvisor"
    if page_title.empty?
      base title
    else 
      "#{base_title} | #{page_title}"
    end
  end
end
