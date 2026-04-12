class Project < ApplicationRecord
  # name에ㅔ 대한 validates추가
  # presence: true는 name이 비어있지 않아야 한다는 의미이다
  validates :name, presence: true
end
