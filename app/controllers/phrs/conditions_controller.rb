class Phrs::ConditionsController < ApplicationController
  def index
    @phr = Phr.find params[:phr_id]
    @conditions = @phr.conditions
  end

  def new
  end

  def create
    @phr = Phr.find params[:phr_id]
    if @phr.conditions.create(params[:condition])
      flash[:notice] = "Condition has been created."
      redirect_to mine_url(:phr => @phr)
    end  
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
