class Enter::ApplicationController < ApplicationController
  before_action :check_enter
  layout 'enter'   #layout밑의 enter템플릿을 쓰겠다.


  private
  def check_enter
    #지금 접속한 친구가 기업회원인지 판별
    #아닐 경우 root페이지
    # if current_user.enter?
    #   puts current_user.enter?
    #   redirect_to stacks_path
    # end

    unless user_signed_in? && current_user.enter?
      redirect_to(root_path, alert: '기업회원만 접근가능합니다.')
    end
  end
end
