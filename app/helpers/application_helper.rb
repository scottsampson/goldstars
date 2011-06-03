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
  
end