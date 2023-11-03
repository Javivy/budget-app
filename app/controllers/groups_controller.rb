class GroupsController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def new
    @group = Group.new(user: current_user)
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
    @category = Group.find(params[:id])
    @transactions = @category.entities.order('created_at DESC')
    @icon = @category.icon
    @total_amount = @transactions.sum(&:amount)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
