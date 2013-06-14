require 'spec_helper'

describe ClassroomsController do

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new classroom in the database" do
        params = {"name" => "English 101", "teacher_id" => "1"}
        Classroom.should_receive(:create).with(params).and_return(Classroom.new)
        post :create, {:teacher_id => 1, :classroom => {name: "English 101", teacher_id: 1}}
      end
    end

    context "with invalid attributes" do
      it "does not save the new classroom in the database without a name" do
        params = {"teacher_id" => "1"}
        Classroom.should_receive(:create).with(params).and_return(nil)
        post :create, {:teacher_id => 1, :classroom => {teacher_id: 1}}
      end

      it "does not save the new classroom in the database without a teacher id" do
        params = {"name" => "English 101"}
        Classroom.should_receive(:create).with(params).and_return(nil)
        post :create, {:teacher_id => 1, :classroom => {name: "English 101"}}
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested classroom to @classroom" do
      classroom = Classroom.create(teacher_id: 1, name: "English 101")
      get :show, id: classroom, teacher_id: 1, format: :json
      assigns(:classroom).should eq(classroom)
      json_response = JSON.parse(response.body).with_indifferent_access

      expect(json_response[:name]).to eq("English 101")
      expect(json_response[:teacher_id]).to eq(1)
      expect(json_response[:created_at]).to be_nil
      expect(json_response[:updated_at]).to be_nil
    end
  end

  describe "PUT #update" do

    context "given valid attributes" do
      it "updates a classroom" do
        @classroom = Classroom.create(teacher_id: 1, name: "Math 101")
        params = {"name" => "English 101", "teacher_id" => "1"}
        put :update, {
                      :teacher_id => 1, :id => @classroom.id,
                      :classroom => params
                     }

        @classroom.reload
        expect(@classroom.name).to eq "English 101"
      end
    end
  end
end

