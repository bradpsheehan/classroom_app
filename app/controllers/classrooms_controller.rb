class ClassroomsController < ApplicationController
  respond_to :json

  def show
    @classroom = Classroom.find params[:id]
    respond_with @classroom
  end

  def create
    @classroom = Classroom.create(params[:classroom])
    redirect_to @classroom if @classroom
  end
end