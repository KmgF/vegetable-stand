class StandsController < ApplicationController
  before_action :authenticate_user!
  before_action :stand_find_method, only:[:show,:edit,:update,:destroy]
  before_action :is_this_administrator?,only:[:edit,:update,:destroy]

  def new
    @stand = Stand.new
  end

  def create
    @stand = Stand.new(stand_params)
    if @stand.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @vegetables = @stand.vegetables
  end

  def edit
  end

  def update
    if @stand.update(stand_params)
      redirect_to stand_path(@stand.id)
    else
      render :edit
    end
  end

  def destroy
    if @stand.destroy
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


  private
  def stand_params
    params.require(:stand).permit(:name, :street_address, :image).merge(user_id: current_user.id)
  end

  def stand_find_method
    @stand = Stand.find(params[:id])
  end

  def is_this_administrator?
      stand_find_method
    unless @stand.user_id == current_user.id
      redirect_to root_path
    end
  end

end
