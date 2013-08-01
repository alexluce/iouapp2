module DeviseHelper

  def insertFlash(flashed)
    if flash[flashed.to_sym]
      content_tag(:div, class: "alert alert-danger") do
        content_tag(:div, flash[flashed.to_sym])
      end
    end
  end

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)
    html = <<-HTML
    <div class="alert alert-danger">
      <h4>#{sentence}</h4>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end