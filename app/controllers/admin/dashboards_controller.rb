class Admin::DashboardsController < ApplicationController

  def dashboard_white_park
    @not_published_opinions = Opinion.where(published: false)
  end

  def change_defence_info
    @text_about_account = ""
    count_change = 0
    # puts params
    unless params["new_email"].nil? && params["new_password"].nil?
      # puts 'params["new_email"] = ' + params["new_email"]
      # puts 'params["new_password"] = ' + params["new_password"]
      if params["new_email"] != ""
        current_moderator.email = params["new_email"]
        current_moderator.save
        count_change += 1
        @text_about_account = "Логин был изменен. "
      end
      @text_about_account = "Пароль слишком короткий. " if params["new_password"].length < Moderator.password_length.min
      if params["new_password"].length >=  Moderator.password_length.min
        current_moderator.password = params["new_password"]
        current_moderator.save
        count_change += 1
        @text_about_account = "Пароль был изменен."
      end
    end
    puts count_change
    @text_about_account += "Ничего не поменялось" if count_change == 0
  end

  def log_out
    sign_out
    redirect_to root_path
  end
end
