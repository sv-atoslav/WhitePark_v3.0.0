class Admin::DashboardsController < ApplicationController

  def dashboard_white_park
    @not_published_opinions = Opinion.where(published: false)
  end

  def change_defence_info
    if params["new_email"]
      current_moderator.email = params["new_email"]
      current_moderator.save
    end
  end

  def log_out
    sign_out
    redirect_to root_path
  end
end
