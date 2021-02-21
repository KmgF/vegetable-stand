class VegetablesController < ApplicationController
  before_action :authenticate_user!,except:[:show]
  before_action :stand_find_method
  before_action :vegetable_find_method,only:[:show,:edit,:update,:destroy]
  before_action :is_this_vege_administrator?,only:[:edit,:update,:destroy]

  def new
    @vegetable = Vegetable.new
  end

  def create
    @vegetable = Vegetable.new(vegetable_params)
    if @vegetable.save
      redirect_to stand_path(@stand)
    else
      @vegetables = @stand.vegetables.includes(:user)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @vegetable.update(vegetable_params)
      redirect_to stand_vegetable_path(@vegetable.id)
    else
      render :edit
    end
  end

  def destroy
    if @vegetable.destroy
      redirect_to stand_path(@stand.id)
    else
      render :show
    end
  end

  private
  def vegetable_params
    params.require(:vegetable).permit(:category,:price,:amount,:message,:shipment_service_id,:delivery_fee_id,:quality_description,:important_notice,:image).merge(user_id:current_user.id,stand_id: params[:stand_id])
  end

  def stand_find_method
    @stand = Stand.find(params[:stand_id])
  end

  def vegetable_find_method
    @vegetable = Vegetable.find(params[:id])
  end

  def is_this_vege_administrator?
    vegetable_find_method
    unless @vegetable.user_id == current_user.id
      redirect_to root_path
    end
  end

end
