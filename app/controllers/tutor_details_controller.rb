class TutorDetailsController < ApplicationController
  before_action :set_tutor_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit, :update, :destroy]
  # GET /tutor_details
  # GET /tutor_details.json
  def index
    @tutor_details = TutorDetail.all    
  end

  # GET /tutor_details/1
  # GET /tutor_details/1.json
  def show
    @user = User.find(@tutor_detail.user_id)
    @level = Level.find(@tutor_detail.level_id)
    @subject = Subject.find(@tutor_detail.subject_id)
  end

  def search 
    @subject_id = params[:subject_id]
    @level_id = params[:level_id]
    @q =params[:q]
    @kind = params[:kind]
    @page = params[:page]

    if @kind.eql?("Tutor")
      @tutor_details = TutorDetail.search(@subject_id, @level_id, @q, @page)
    else
      @class_details = ClassDetail.search(@subject_id, @level_id, @q, @page)
    end
  end

  def search_by_subject
    @tutor_details = ClassDetail.all.where()
  end
  # GET /tutor_details/new
  def new
    @tutor_detail = TutorDetail.new
  end

  # GET /tutor_details/1/edit
  def edit
  end

  # POST /tutor_details
  # POST /tutor_details.json
  def create
    @tutor_detail = TutorDetail.new(tutor_detail_params)
    @tutor_detail.user_id = current_user.id
    # binding.pry

    respond_to do |format|
      if @tutor_detail.save
        format.html { redirect_to @tutor_detail, notice: 'Tutor detail was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_detail }
      else
        format.html { render :new }
        format.json { render json: @tutor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_details/1
  # PATCH/PUT /tutor_details/1.json
  def update
    respond_to do |format|
      if @tutor_detail.update(tutor_detail_params)
        format.html { redirect_to @tutor_detail, notice: 'Tutor detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_detail }
      else
        format.html { render :edit }
        format.json { render json: @tutor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_details/1
  # DELETE /tutor_details/1.json
  def destroy
    @tutor_detail.destroy
    respond_to do |format|
      format.html { redirect_to tutor_details_url, notice: 'Tutor detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_detail
      @tutor_detail = TutorDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_detail_params
      # binding.pry
      params.require(:tutor_detail).permit(:subject_id, :level_id)
    end
end
