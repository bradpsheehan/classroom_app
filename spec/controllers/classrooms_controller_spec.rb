require 'spec_helper'

describe ClassroomsController do
  let(:teacher){ stub(id: 1) }

  describe "GET #show" do
    it "assigns the requested classroom to @classroom" do
      classroom = Classroom.create(teacher_id: teacher.id, name: "English 101")
      get :show, id: classroom
      assigns(:classroom).should eq(classroom)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new classroom in the database" do
        params = {"name" => "English 101", "teacher_id" => "1"}
        Classroom.should_receive(:create).with(params).and_return(Classroom.new)
        post :create, {:classroom => {name: "English 101", teacher_id: 1}}
      end
    end

    context "with invalid attributes" do
      xit "does not save the new classroom in the database" do
        params = {"teacher_id" => "1"}
        Classroom.should_receive(:create).with(params).and_return(nil)
        post :create, {:classroom => {teacher_id: 1}}
      end
    end
  end
end