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
end