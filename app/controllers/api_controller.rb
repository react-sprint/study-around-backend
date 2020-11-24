class ApiController < ApplicationController
  ## API Controller 액션에 방문 전, application Controller의 jwt_authenticate_request! 메소드 발동
  before_action :jwt_authenticate_request!

  ## test 액션에 방문에 있어 토큰 검증 성공 시, Token 인증 성공 메세지가 응답될 것입니다.
  def test
    @dataJson = { :message => "[Test] Token 인증 되었습니다! :D", :user => current_user }
    render :json => @dataJson, :except => [:id, :created_at, :updated_at]
  end
  
end
