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
    @beer = current_user.beers.build(beer_params)
    if @beer.save
      if @style
      redirect_to beers_path(@style)
    else
      redirect_to beers_path
    end
  else
      flash.now[:error] = @beer.errors.full_messages
      if @style
        render :new_style_beer
      else
        render :new
      end
    end
  end

  def edit
    redirect_to beers_path unless @beer.user == current_user
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
    if @beer.user == current_user
    @beer.destroy
    flash[:notice] = "#{@beer.name} was deleted"
    redirect_to beers_path
    end
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
        :comments,
        style_attributes: [:name]
        )
    end

    
end
