class Moderators::SessionsController < Devise::SessionsController
  layout "empty"
  # before_action :configure_sign_in_params, only: [:create]

  $nwtgis = 0 #number wrong try go into site
  #GET /resource/sign_in
  def new
    if params["try"].nil? || $nwtgis.nil?
      $nwtgis = 0
    else
      $nwtgis += params["try"].to_i
    end
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  #DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
