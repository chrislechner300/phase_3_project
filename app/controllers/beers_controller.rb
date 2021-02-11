class BeersController < ApplicationController
  before_action :find_style, only: [:index, :new, :create]
  before_action :find_beer, only: [:show, :edit, :update, :destroy]
  layout "beers_layout"

  def index
    if @style
      @beers = @style.beers
    else
      @beers = Beer.all
    end
  end

  def show
  end

  def new
    if @style
      @beer = @style.beers.build
      render :new_style_beer
    else
      @beer = Beer.new
    end
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      # something if valid
      if @style
      redirect_to beers_path(@style)
    else
      redirect_to beers_path
    end
  else
      #something if not valid
      flash.now[:error] = @beer.errors.full_messages
      if @style
        render :new_style_beer
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @beer.update(beer_params)
     redirect_to beer_path(@beer)
    else
      flash.now[:error] = @beer.errors.full_messages
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

    def find_style
      if params[:style_id]
        @style = Style.find_by_id(params[:style_id])
      end
    end

    def beer_params
      params.require(:beer).permit(
        :name,
        :style_id,
        :brewery,
        :sample_date,
        style_attributes: [:name]
        )
    end
end
