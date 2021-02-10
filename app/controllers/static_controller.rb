class StaticController < ApplicationController

  def home
    render layout: "home_layout"
  end
end
