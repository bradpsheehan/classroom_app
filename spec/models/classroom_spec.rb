require 'spec_helper'

describe Classroom do

  context "happy path" do
    before do
      @classroom = Classroom.new(teacher_id: 1, name: "english")
    end

    it "has a teacher" do
      expect(@classroom.teacher_id).to eq 1
    end

    it "has a name" do
      expect(@classroom.name).to eq "english"
    end
  end

  context "with missing information" do
    it "has an error without a teacher id" do
      classroom = Classroom.new(name: "english")
      expect(classroom).to have(1).error_on(:teacher_id)
    end

    it "has an error with a blank name" do
      classroom = Classroom.new(teacher_id: 1, name: "")
      expect(classroom).to have(1).error_on(:name)
    end

    it "has an error without a name" do
      classroom = Classroom.new(teacher_id: 1)
      expect(classroom).to have(1).error_on(:name)
    end
  end

  describe ".create_with_students" do
    it "creates a class with students" do
      classroom = Classroom.create_with_students(teacher_id: 1, name: "english", students: [1, 2, 3])
      expect(classroom.students).to eq([1, 2, 3])
    end
  end

  context "adding students" do
    it "can add students" do
      classroom = Classroom.create_with_students(teacher_id: 1, name: "english", students: [1, 2, 3])
      classroom.add_students(4, 5)
      expect(classroom.students).to eq([1, 2, 3, 4, 5])
    end

    it "doesn't add duplicate students" do
      classroom = Classroom.create_with_students(teacher_id: 1, name: "english", students: [1, 2, 3])
      classroom.add_students(3, 4, 5)
      expect(classroom.students).to eq([1, 2, 3, 4, 5])
    end

    it "adds students if no students exist yet" do
      classroom = Classroom.create_with_students(teacher_id: 1, name: "Social Studies")
      classroom.add_students(1, 2)
      expect(classroom.students).to eq([1, 2])
    end
  end

  context "removing students" do
    it "can remove students" do
      classroom = Classroom.create_with_students(teacher_id: 1, name: "math", students: [1, 2, 3])
      classroom.remove_students(1, 3)
      expect(classroom.students).to eq([2])
    end

    it "doesn't break when there are no students" do
      classroom = Classroom.new(teacher_id: 1, name: "Social Studies")
      classroom.remove_students(1, 2)
      expect(classroom.students).to eq([])
    end
  end
end