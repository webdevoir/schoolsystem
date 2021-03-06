class CalendersController < ApplicationController
  before_action :set_calender, only: [:show, :edit, :update, :destroy]

  # GET /calenders
  # GET /calenders.json
  def index
    @type = params[:type]
    if params[:type] == "kg"
      @calenders = Calender.where(:grade => "KG1tokg3")
      # return render json: @calenders

    elsif params[:type] == "one"
      @calenders = Calender.where(:grade => "Grade1to3")
      # return render json: @calenders
    elsif params[:type] == "four"
      @calenders = Calender.where(:grade => "Grade4to9")
      # return render json: @calenders
    end
    if @calenders.nil?
      @calenders = []
      return render json: @calender
    end
    @calender = Calender.new

  end

  def calenderdetail
    Calender.all
  end

  def calenderdata
    if params[:type] == "KG1tokg3"
      @calenders = Calender.where(:grade => "KG1tokg3")
      # return render json: @calenders

    elsif params[:type] == "Grade1to3"
      @calenders = Calender.where(:grade => "Grade1to3")
      # return render json: @calenders
    elsif params[:type] == "Grade4to9"
      @calenders = Calender.where(:grade => "Grade4to9")
      # return render json: @calenders
    end
  end

  # GET /calenders/1
  # GET /calenders/1.json
  def show
  end

  # GET /calenders/new
  def new
    @calender = Calender.new
  end

  # GET /calenders/1/edit
  def edit
  end

  # POST /calenders
  # POST /calenders.json
  def create
    @calender = Calender.new(calender_params)

    respond_to do |format|
      if @calender.save
        format.html { redirect_to @calender, notice: 'Calender was successfully created.' }
        format.json { render :show, status: :created, location: @calender }
      else
        format.html { render :new }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calenders/1
  # PATCH/PUT /calenders/1.json
  def update
    respond_to do |format|
      if @calender.update(calender_params)
        format.html { redirect_to @calender, notice: 'Calender was successfully updated.' }
        format.json { render :show, status: :ok, location: @calender }
      else
        format.html { render :edit }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calenders/1
  # DELETE /calenders/1.json
  def destroy
    @calender.destroy
    respond_to do |format|
      format.html { redirect_to calenders_url, notice: 'Calender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender
      @calender = Calender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calender_params
      params.require(:calender).permit(:title, :description, :starttime, :endtime,:grade)
    end
end


