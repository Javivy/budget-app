class HomeController < ApplicationController
  def index
    @categories = current_user.groups
    render 'groups/index'
  end
end
