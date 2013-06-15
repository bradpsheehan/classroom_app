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

    json_response = if @classroom.update_attributes(params[:classroom])
      {:json => @classroom}
    else
      {:json => @classroom, :methods => :errors}
    end

    respond_to do |format|
      format.json { render json_response }
    end

  end
end