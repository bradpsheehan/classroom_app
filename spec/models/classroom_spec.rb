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
    it "is invalid without a teacher id" do
      classroom = Classroom.new(name: "english")
      expect(classroom).to_not be_valid
    end

    it "is invalid without a name" do
      classroom = Classroom.new(teacher_id: 1)
      expect(classroom).to_not be_valid
    end
  end
end