class ClassroomsController < ApplicationController
  respond_to :json

  def show
    @classroom = Classroom.find params[:id]
    respond_with @classroom
  end
end