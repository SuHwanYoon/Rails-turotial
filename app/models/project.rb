class Project < ApplicationRecord
  # name에ㅔ 대한 validates추가
  # presence: true는 name이 비어있지 않아야 한다는 의미이다
  # validates :name, presence: true -> 기본설정
  # 에러메세지 커스텀
  validates :name, presence: { message: "Did you forget to add a name?" }
end
