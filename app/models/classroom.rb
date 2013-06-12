class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name

  validates_presence_of :teacher_id
  validates_presence_of :name

  before_save :unique_class_name_teacher_combo


  def unique_class_name_teacher_combo
    #TODO - write this method; should it be private?
  end
end
