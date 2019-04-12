class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      
    else
      # flash.now[:errors] = 
    end
    
  end

  def new
    @band = Band.new
    render :new
  end

  def show
  
  end

  def edit
  
  end

  def update
  
  end

  def destroy
  
  end

  private
  
  def band_params
    params.require(:band).permit(:name)
  end

end
