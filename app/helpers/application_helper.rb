module ApplicationHelper
  def render_nav_links
    if true # is logged in
      content_tag("ul") do
        content_tag("li") do
          link_to("Beers", beers_path)
        end +
        content_tag("li") do
          link_to("Create Beer", new_beer_path)
        end
      end
    else
      content_tag("ul") do
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
