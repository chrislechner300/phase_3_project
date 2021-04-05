class StylesController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find_by_id(params[:id])
  end
  
  def new
    @style = Style.new
    @style.beers.build
  end

  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to beers_path
    else
      render :new
    end
  end


  private
  def style_params
    params.require(:style).permit(
      :name,
      beers_attributes: [:name, :brewery, :sample_date, :rating, :comments]
      )
  end
end
