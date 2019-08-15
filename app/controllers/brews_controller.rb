class BrewsController < ApplicationController
  before_action :grab_brew, only: [:show, :edit, :update, :destroy]

  def index
    @brews = Brew.all
  end

  def show
  end

  def new
    @brew = Brew.new
  end

  def edit
     
  end

  def create
    @brew = Brew.new(brew_params)
    if @brew.save
      redirect_to brew_path(@brew)
    else
      render :new
    end
  end

  def update
    @brew.update(brew_params)
    redirect_to brews_path
  end

  def destroy
    @brew.delete
    redirect_to brews_path
  end

  def strongest
    @brews = Brew.strongest
  end

  private

    def grab_brew
      @brew = Brew.find(params[:id])
    end
    
    def brew_params
      params.require(:brew).permit(:blend_name, :origin, :notes, :strength)
    end

end
