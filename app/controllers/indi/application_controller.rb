class Indi::ApplicationController < ApplicationController
  before_action :check_admin
  layout 'indi'   #layout밑의 admin템플릿을 쓰겠다.


  private
  def check_admin
    #지금 접속한 친구가 관리자인지 판별
    #아닐 경우 root페이지
    unless user_signed_in? && current_user.indi?
      redirect_to(root_path, alert: '개인회원만 접근가능합니다.')
    end
  end
end
