class BeersController < ApplicationController

  before_action :find_beer, only: [:show]

  def index
    @beers = Beer.all
  end

  def show
  end

  private
    def find_beer
      @beer = Beer.find_by_id(params[:id])
    end

end
