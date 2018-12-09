class SummonDetailsController < ApplicationController
  def index
    @summons = SummonDetail.all
  end

  def new
    @summon = SummonDetail.new
  end

  def create
    @summon = SummonDetail.new(summon_params)

    if @summon.save
      flash[:success] = 'Create summon success'
      redirect_to summon_details_path
    else
      flash[:error] = @summor.errors.full_messages
      render :new
    end
  end

  def edit
    @summon = SummonDetail.where(id: params[:id]).first
  end

  def update
    @summon = SummonDetail.where(id: params[:id]).first
    if @summon.update(summon_params)
      flash[:success] = 'Update summon success'
      redirect_to summon_details_path
    else
      flash[:error] = @summor.errors.full_messages
      render :edit
    end
  end

  def destroy
    @summon = SummonDetail.where(id: params[:id]).first
    @summon.destroy

    flash[:success] = 'Delete summon success'
    redirect_to summon_details_path
  end

  private

  def summon_params
    params.require(:summon_detail).permit(:name, :aura, :mlb_aura, :flb_aura, :small_pic, :medium_pic, :large_pic)
  end
end
