module ApplicationHelper
  # app/helpers/application_helper.rb
  def navbar_links(links)
    html = ''
    links.each do |link|
      text = link.keys.first
      path = link.values.first
      html += content_tag(:li, class: 'nav-item') do
        link_to text, path, class: 'nav-link'
      end
    end
    html.html_safe
  end

  def remove_utc(datetime)
    datetime.strftime('%Y-%m-%d %H:%M')
  end
end
