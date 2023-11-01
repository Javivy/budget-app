class StaticController < ApplicationController
  skip_before_action :authenticate_user!

  def splash
  end
end
