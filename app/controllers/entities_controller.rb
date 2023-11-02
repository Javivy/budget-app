class EntitiesController < ApplicationController
  def index
  end

  def new
    @categories = current_user.groups
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      redirect_to group_path(entity_params[:group_id])
    else
      # Handle validation errors or other issues with saving
      flash[:error] = 'There was an error creating the new transaction, please try again.'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
