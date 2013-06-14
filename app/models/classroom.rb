class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name

  validates_presence_of :teacher_id
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :teacher_id

end
