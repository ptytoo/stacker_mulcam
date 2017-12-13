class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @company_fields = CompanyField.all
    super
  end

  # POST /resource
  def create
    @company_fields = CompanyField.all
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  private

  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:nickname, :phone, :role, :company_id)
  end

  def account_update_params
    params.require(:user).permit(:email,:password,:password_confirmation,:nickname, :phone, :role,:current_password,:company_id)
  end

  # The path used after sign up. 회원가입 클릭 후 이동하는 패스 설정하는 함수
  def after_sign_up_path_for(resource)
    #개인 회원일 경우와 기업회원일 경우를 나눠서 path설정
    if current_user.indi?
      add_my_indi_users_path
    else
      enter_company_path(current_user.company_id)
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
