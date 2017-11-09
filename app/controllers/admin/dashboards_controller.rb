class Admin::DashboardsController < ApplicationController
  def dashboard_1
  end

  def dashboard_2
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render :layout => "layout_2"
  end

  def dashboard_4_1
  end

  def dashboard_5
  end

  def dashboard_white_park
    if params["new_email"]
      current_moderator.email = params["new_email"]
      current_moderator.save
    end
    @not_published_opinions = Opinion.where(published: false)
  end

end
