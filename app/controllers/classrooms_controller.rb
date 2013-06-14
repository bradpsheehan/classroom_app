class ClassroomsController < ApplicationController
  respond_to :json

  def show
    @classroom = Classroom.find params[:id]
    respond_with @classroom
  end

  def create
    @classroom = Classroom.create(params[:classroom])
    respond_with @classroom
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update_attributes(params[:classroom])
    respond_with @classroom
  end
end