module ApplicationHelper
  
  def current_tab?(controller_name)
    controller.controller_name == controller_name
  end

  def stars(num)
    stars = ""
    for i in 1..num
      stars += "<img src=\"/images/star.png\"\\>"
    end
    stars += "\n"
    stars.html_safe
  end
  
  def stars_nowrap(numstars, limit=45, string='')
    if numstars <= limit
      stars numstars
    else
      string.empty? ? numstars.to_s : string
    end
  end
  
end