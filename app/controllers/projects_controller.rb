class ProjectsController < ApplicationController
  # index method를 정의하고 view에서 사용할수 있는
  # 인스턴스 변수를 @로 전달한다
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
