class Todo < ApplicationRecord
# belongs_to는 N:1 관계를 설정하여 할 일이 특정 프로젝트에 속함을 나타낸다
# project_id 외래 키를 통해 연관된 프로젝트를 참조한다
  
 belongs_to :project
end
