module DeviseHelper

  def insertFlash(flashed)
    if flash[flashed.to_sym]
      content_tag(:div, class: "alert alert-danger") do
        content_tag(:div, flash[flashed.to_sym])
      end
    elsif resource.errors.any?
      content_tag(:div, class: "alert alert-danger") do
        resource.errors.each do |key, error|
          content_tag(:div, resource.errors)
        end
      end
    end
  end

end