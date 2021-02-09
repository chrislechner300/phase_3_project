class BeersController < ApplicationController

  before_action :find_beer, only: [:show, :edit, :update, :destroy]

  def index
    @beers = Beer.all
  end

  def show
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      # something if valid
      redirect_to beers_path
    else
      #something if not valid
      render :new
    end
  end

  def edit
  end

  def update
    if @beer.update(beer _params)
     redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    flash[:notice] = "#{@beer.name} was deleted"
    redirect_to beers_path
  end

  private
    def find_beer
      @beer = Beer.find_by_id(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:name, :style, :brewery, :sample_date)
    end
end
