class ProjectController < ApplicationController
  before_action :jwt_authenticate_request!
  
  def join
  end
  
  def create
    p current_user
    p "create"
    p params
    p params[:project][:name]

    project = Project.new
    project.name = params[:project][:name]
    project.introduce = params[:project][:introduce]
    project.manager_introduce = params[:project][:manager_introduce]
    # project.manager = current_user.id
    
    project.wday = params[:project][:wday]
    project.start_hour = params[:project][:start_hour]
    project.start_minute = params[:project][:start_minute]
    project.end_hour = params[:project][:end_hour]
    project.end_minute = params[:project][:end_minute]

    # authorization_password
    source = ("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
    key = ""
    6.times{ key += source[rand(source.size)].to_s }
    project.authorization_password = key
    project.save

    group = GroupUserAndProject.new
    group.user_id = current_user.id
    group.project_id = project.id
    group.save
    
    render :json => {}
    # @dataJson = { :message => "[Test] Token 인증 되었습니다! :D", :user => current_user }
    # render :json => @dataJson, :except => [:id, :created_at, :updated_at]
  end

  def show
  end

  def delete
  end

  def update
  end

end