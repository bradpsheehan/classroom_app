class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name
  has_many :classroom_students

  validates_presence_of :teacher_id
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :teacher_id

  def to_json(options = {})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end

  def self.create_with_students params
    classroom = self.create(teacher_id: params[:teacher_id], name: params[:name])
    classroom.add_students(*params[:students]) if classroom
    classroom
  end

  def students
    classroom_students.pluck(:student_id)
  end

  def add_students(*new_students)
    new_students -= students
    new_students.each do |student|
      classroom_students.build(student_id: student)
    end
    save
  end

  def remove_students(*bad_students)
    classroom_students.where(student_id: bad_students).destroy_all
  end
end
