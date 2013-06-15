class ClassroomsController < ApplicationController
  respond_to :json

  def show
    @classroom = Classroom.find(params[:id])
    respond_with @classroom
  end

  def create
    @classroom = Classroom.new(params[:classroom])
    @classroom.save
    if @classroom.save
      respond_with(@classroom, :location => classroom_path(@classroom.teacher_id, @classroom))
    else
      respond_with(@classroom)
    end

  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update_attributes(params[:classroom])
    respond_to do |format|
      format.json { render :json => @classroom }
    end
  end
end