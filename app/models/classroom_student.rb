class ClassroomStudent < ActiveRecord::Base
  attr_accessible :student_id, :classroom_id
  has_many :classrooms

  validates :student_id, :uniqueness => { :scope => :classroom_id,
    :message => "Student already in classroom" }
end