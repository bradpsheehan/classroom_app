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
end