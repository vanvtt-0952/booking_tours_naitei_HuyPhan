module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "title_base"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      type = "info" if type == "info"
      type = "warning" if type == "warning"
      text = "toastr.#{type}(\"#{message}\"); "
      flash_messages << text if message
    end
    flash_messages.join("\n")
  end

  def check_image image
    image ||= Settings.image_default
    image_tag(image, class: "profile_image")
  end
end
