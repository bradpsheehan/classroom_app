require 'spec_helper'

describe ClassroomsController do

  describe "POST #create" do

#TODO CHANGE STUBS TO ACTUALLY HIT THE DB
    context "with valid attributes" do
      it "saves the new classroom in the database" do
        params = {name: "English 101", teacher_id: 1}
        post :create, {:teacher_id => 1, :classroom => params, format: :json}
        json_response = JSON.parse(response.body).with_indifferent_access

        expect(json_response[:name]).to eq("English 101")
        expect(json_response[:teacher_id]).to eq(1)
        expect(json_response[:created_at]).to be_nil
        expect(json_response[:updated_at]).to be_nil
      end
    end

    context "with invalid attributes" do
      it "does not save the new classroom in the database without a name" do
        post :create, {:teacher_id => 1, :classroom => {teacher_id: 1}, format: :json}
        json_response = JSON.parse(response.body).with_indifferent_access

        expect(json_response[:errors]).to eq({"name"=>["can't be blank"]})
      end

      it "does not save the new classroom in the database without a teacher id" do
        post :create, {:teacher_id => 1, :classroom => {name: "English 101"}, format: :json}
        json_response = JSON.parse(response.body).with_indifferent_access
        expect(json_response[:errors]).to eq({"teacher_id" => ["can't be blank"]})
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
        classroom = Classroom.create(teacher_id: 1, name: "Math 101")
        params = {"name" => "English 101"}

        put :update, {
                      :teacher_id => 1,
                      :id => classroom.id,
                      :classroom => params,
                      format: :json
                     }
        # binding.pry
        json_response = JSON.parse(response.body).with_indifferent_access

        expect(json_response[:name]).to eq("English 101")
      end
    end

    context "given invalid attributes" do
      it "has errors" do
        classroom = Classroom.create(teacher_id: 1, name: "Math 101")
        params = {"name" => ""}

        put :update, {
                      :teacher_id => 1,
                      :id => classroom.id,
                      :classroom => params,
                      format: :json
                     }
        # binding.pry
        json_response = JSON.parse(response.body).with_indifferent_access

        expect(json_response[:errors]).to eq({"name"=>["can't be blank"]})
      end
    end
  end
end

