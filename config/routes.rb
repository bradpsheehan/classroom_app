ClassroomApp::Application.routes.draw do
  scope "/teachers/:teacher_id" do
    resources :classrooms
  end
end
