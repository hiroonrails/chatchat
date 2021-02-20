class ApplicationController < ActionController::Base
#ログインしていないユーザーの時点でログイン画面に移管させる
before_action :authenticate_user!
#サインアップ時にnameカラム(名前)をDBに保存させるため、前提として保存できるカラム情報が限られている(deviseの場合)
before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    #(:sign_up, keys: [name])＝サインアップ時って意味。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
