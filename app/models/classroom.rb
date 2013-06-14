class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :name

  validates_presence_of :teacher_id
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :teacher_id

  def to_json(options = {})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end

end
