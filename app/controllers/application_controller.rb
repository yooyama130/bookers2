class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト処理
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # ログアウト後のリダイレクト処理
  def after_sign_out_path_for(resource)
    root_path
  end

  # アカウント登録後のリダイレクト処理
  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
