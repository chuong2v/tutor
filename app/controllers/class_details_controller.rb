class ClassDetailsController < ApplicationController
  before_action :set_class_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :check_title, only: [:update, :create]
  before_action :check_possitive, only: [:edit, :update, :destroy]
  # GET /class_details
  # GET /class_details.json
  def index
    @class_details = ClassDetail.all.order(updated_at: :desc)    
    # @q = ClassDetail.ransack(params[:q])   
    # @class_details = @q.result 
    @class_details = @class_details.paginate(:page => params[:page], :per_page  => 10)
  end

  # GET /class_details/1
  # GET /class_details/1.json
  def show
    @title = ClassDetail.find(@class_detail.id).title + " - Tutors"
    @subject_ids = ClassSubject.where(cd_id: @class_detail.id).select("subject_id") 
    @class_times = ClassTime.where(cd_id: @class_detail.id)
    # binding.pry
  end

  # GET /class_details/new
  def new
    @class_detail = ClassDetail.new
  end

  # GET /class_details/1/edit
  def edit
  end

  # POST /class_details
  # POST /class_details.json
  def create
    # binding.pry
    @class_detail = ClassDetail.new(class_detail_params)
    @class_detail.user_id = current_user.id       
  # k.user_id = current_user.id  
    respond_to do |format|
      if @class_detail.save
        format.html { redirect_to @class_detail, notice: 'Class detail was successfully created.'}
        format.json { render :show, status: :created, location: @class_detail }
      else
        format.html { render :new }
        format.json { render json: @class_detail.errors, status: :unprocessable_entity }
      end
    end
    @subject_ids = params[:subject_ids]
    @subject_ids.collect {|id| ClassSubject.create(subject_id: id, cd_id: @class_detail.id)}

    @dow_ids = params[:dow_ids]
    @tod_ids = params[:tod_ids]
    # binding.pry
    @dow_ids.each do |dow_id| 
      ClassTime.create(cd_id: @class_detail.id, dow_id: dow_id, tod_id: @tod_ids[dow_id.to_i - 1])
    end
  end

  # PATCH/PUT /class_details/1
  # PATCH/PUT /class_details/1.json
  def update
    respond_to do |format|
      if @class_detail.update(class_detail_params)
        format.html { redirect_to @class_detail, notice: 'Class detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_detail }
      else
        format.html { render :edit }
        format.json { render json: @class_detail.errors, status: :unprocessable_entity }
      end
    end
    @subject_ids = params[:subject_ids]
    ClassSubject.destroy_all(cd_id: @class_detail.id)
    @subject_ids.collect {|id| ClassSubject.create(subject_id: id, cd_id: @class_detail.id)}
  end

  # DELETE /class_details/1
  # DELETE /class_details/1.json
  def destroy
    @class_detail.destroy
    respond_to do |format|
      format.html { redirect_to class_details_url, notice: 'Class detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_detail
      @class_detail = ClassDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_detail_params
      params.require(:class_detail).permit(:level_id, :salary, :gender_id, :title, :description, :address)
    end

    def check_title
      redirect_to :back, notice: 'Title is not allowed to be blank.' if class_detail_params[:title].blank?
    end

    def check_possitive
      unless current_user.id == ClassDetail.find(params[:id]).user_id
        redirect_to class_detail_path
      end 
    end
end
