class ApplicationController < ActionController::Base
  
   before_action :authenticate_user!,except: [:top]
  # ログイン認証が成功していないと、トップページ以外の画面（ログインと新規登録は除く）は表示できない仕様

  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  # ログイン後は投稿一覧画面に遷移

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定
  # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可

end
