module ApplicationHelper
  def display_errors(obj)
    if obj.errors.any?
      content_tag(:ul) do
        obj.errors.full_messages.each do |msg|
          concat(content_tag(:li, msg))
        end
      end
    end
  end

  def display_alert(flash)
    display_flash(flash[:alert], 'alert') if flash[:alert]
  end

  def display_notice(flash)
    display_flash(flash[:notice], 'notice') if flash[:notice]
  end

  def display_flash(msg, html_class)
    content_tag(:div, content_tag(:p, msg), class: html_class)
  end
end
