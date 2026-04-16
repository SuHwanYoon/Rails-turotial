class ProjectsController < ApplicationController
  # index method를 정의하고 view에서 사용할수 있는
  # 인스턴스 변수를 @로 전달한다
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  # 새로운 프로젝트 객체를 생성하여 입력 폼(view)에 전달하는 메서드
  def new
    @project = Project.new
  end

  # 사용자가 입력한 데이터를 데이터베이스에 실제로 저장하는 메서드
  def create
  # project_params 메서드를 통해 강력한 매개변수(strong parameters)를 사용하여 프로젝트 객체를 초기화한다
  # project_params 메서드는 params.require(:project).permit(:name) 코드를 사용하여
  # 프로젝트 객체를 생성할 때 허용된 매개변수를 지정한다
  # strong parameters란 사용자가 웹 폼을 통해 제출한 데이터를 안전하게 처리하기 위한 Rails의 기능이다
  @project = Project.new(project_params)
    # 데이터베이스에 저장
    # 저장이 성공하면 프로젝트 상세 페이지로 리다이렉트하고, 실패하면 다시 입력 폼(new)로 렌더링한다
    if @project.save
      # flash message를 설정
      flash[:notice] = "Project was successfully created."
      # router의 설정으로인해 helper method가 생기고 거기에 인스턴스 변수를 넣어 지정한다
      # rails내부에서는 @project.to_param이 실행되어서 id값이 반환되고 그 id값이 url로 들어가게 된다
      redirect_to project_path(@project)
    else
      # render -> method
      # :new , :uprocessable_entity -> symbol
      # status: keyword arguments
      # uprocessable_entity -> Http status 422
      render :new, status: :unprocessable_entity

    end
  end


  # edit경로로 들어가서 실행되는 update method
  def update
    # project_params 메서드를 통해 강력한 매개변수(strong parameters)를 사용하여 프로젝트 객체를 초기화한다
    # project_params 메서드는 params.require(:project).permit(:name) 코드를 사용하여
    # 프로젝트 객체를 생성할 때 허용된 매개변수를 지정한다
    # strong parameters란 사용자가 웹 폼을 통해 제출한 데이터를 안전하게 처리하기 위한 Rails의 기능이다
    @project = Project.find(params[:id])
    #  데이터베이스에 업데이트
    # 업데이트가 성공하면 프로젝트 상세 페이지로 리다이렉트하고, 실패하면 다시 수정 폼(edit)으로 렌더링한다
    if @project.update(project_params)
      # router의 설정으로인해 helper method가 생기고 거기에 인스턴스 변수를 넣어 지정한다
      # rails내부에서는 @project.to_param이 실행되어서 id값이 반환되고 그 id값이 url로 들어가게 된다
      redirect_to project_path(@project)
    else
      # render -> method
      # :new , :uprocessable_entity -> symbol
      # status: keyword arguments
      # uprocessable_entity -> Http status 422
      render :edit, status: :unprocessable_entity

    end
  end


  # edit method
  def edit
    @project = Project.find(params[:id])
  end

  # update method
  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      # flash message를 설정
      flash[:notice] = "Project was successfully updated."
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # destroy method


  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:notice] = "Project was successfully destroyed."
    redirect_to projects_path, status: :see_other
  end

  private
  # project_params 메서드를 정의
  # params.require(:project).permit(:name) 코드를 사용하여 프로젝트 객체를 생성할 때 허용된 매개변수를 지정한다
  def project_params
   params.require(:project).permit(:name)
  end
end
