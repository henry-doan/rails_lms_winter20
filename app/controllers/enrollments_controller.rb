class EnrollmentsController < ApplicationController
  before_action :set_course
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  def index
    # @enrollments = @course.enrollments
    @teachers = @course.enrollments.where(role: 'teacher')
    @tas = @course.enrollments.where(role: 'ta')
    @students = @course.enrollments.where(role: 'student')
  end

  def show
  end

  def new
    @users = User.all - @course.users 
    @enrollment = @course.enrollments.new
  end

  def create
    @enrollment = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def edit
    @users = User.all - @course.users 
  end

  def update
    if @enrollment.update(enrollment_params)
      redirect_to course_enrollments_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @enrollment.destroy
    redirect_to course_enrollments_path(@course)
  end

  private 
    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_enrollment
      @enrollment = @course.enrollments.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:role, :user_id)
    end
end
