class Project < ApplicationRecord
  # has_many의 역할은 1:N 관계를 설정하여 프로젝트가 여러 개의 할 일(todos)을 가질 수 있게 한다
  # dependent: :destroy는 프로젝트가 삭제될 때 연관된 todo들도 함께 삭제되도록 한다
  # destory를 사용하는이유는 데이터 무결성을 유지하고 고아 레코드(부모가 없는 자식 데이터)가 남는 것을 방지하기 위해서입니다
  # 하나의 프로젝트의 여러개의 todo가 연계되는 설계
  # Project가 부모 모델이 됨
  has_many :todos, dependent: :destroy
  # name에ㅔ 대한 validates추가
  # presence: true는 name이 비어있지 않아야 한다는 의미이다
  # validates :name, presence: true -> 기본설정
  # 에러메세지 커스텀
  validates :name, presence: { message: "Did you forget to add a name?" }
end
