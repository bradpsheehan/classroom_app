class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name, :students
  serialize :students

  validates_presence_of :teacher_id
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :teacher_id

  def to_json(options = {})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end

  def add_students(*new_students)
    students << new_students
    students.flatten!.uniq!
  end

  def remove_students(*bad_students)
    students.delete_if{|s| bad_students.include?(s)}
  end
end
