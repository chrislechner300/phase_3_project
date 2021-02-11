module ApplicationHelper
  def render_nav_links
    content_tag("ul", class: "right") do
      if true 
        content_tag("li") do
          link_to("Beers", beers_path)
        end +
        content_tag("li") do
          link_to("Create Beer", new_beer_path)
        end
      else
        content_tag("li") do
          link_to("Login", "#")
        end +
        content_tag("li") do
          link_to("Signup", "#")
        end
      end
    end
  end
end
