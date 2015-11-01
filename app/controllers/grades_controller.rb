class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json

  def add_students
    @grade = Grade.find(params[:id])
    @students = Grade.find_by_name(@grade.name).students
  end

  def student_add
    if params[:flags]
      student_ids = params[:flags].keys
      student_ids.try(:each) do |std_id|
        s = Student.find(std_id)
        s.grade_id = params[:grade_id]
        s.save!
      end
    end
    redirect_to all_student_grades_path({grade_id: params[:grade_id]}), notice: "Students added to the Class successfully"
  end

  def index
    if current_user.role.rights.where(value: "view_grade").nil?
      redirect_to :back, alert: "Sorry! You are not authorized"
    else
      @grades = Grade.where.not(section: nil)
    end

  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    # return render json: params
    if current_user.role.rights.where(value: "create_grade").nil?
      redirect_to :back, alert: "Sorry! You are not authorized"
    else
      if params[:maingrade]
        @maingrade = true
      end
      @grade = Grade.new
      @batch = Batch.all.pluck(:name, :id)
      @batches=Batch.all
    end

  end

  # GET /grades/1/edit
  def edit
    if current_user.role.rights.where(value: "update_subject").nil?
      redirect_to :back, alert: "Sorry! You are not authorized"
    end
    @employees = Employee.where('employee.category.name' => "Academic")
    @batches = Batch.all
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      if params[:maingrade]
        redirect_to grades_path, notice: "Class Added Successfully"
      else
        redirect_to new_bridge_path(class_id: @grade.id), notice: "Class Added Successfully"
      end
    end
  end

  def all_student
    if params[:grade_id]
      @grade = Grade.find(params[:grade_id])
    else
      @bridge = Bridge.find(params[:bridge_id])
      @grade = @bridge.grade
    end
    @students = @grade.students
    @student = @students.first
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_path, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.students.try(:each) do |std|
      std.grade_id = nil
    end
    @grade.bridges.delete_all
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :section, :batch_id)
    end
end
