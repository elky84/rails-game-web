class MasteryPointInfosController < ApplicationController
  before_action :set_mastery_point_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /mastery_point_infos
  # GET /mastery_point_infos.json
  def index
    if params[:search]
      @mastery_point_infos = MasteryPointInfo.search(params[:search])
    else
      @mastery_point_infos = MasteryPointInfo.limit(100)
    end
  end

  # GET /mastery_point_infos/1
  # GET /mastery_point_infos/1.json
  def show
  end

  # GET /mastery_point_infos/new
  def new
    @mastery_point_info = MasteryPointInfo.new
  end

  # GET /mastery_point_infos/1/edit
  def edit
  end

  # POST /mastery_point_infos
  # POST /mastery_point_infos.json
  def create
    @mastery_point_info = create_or_update(:MASTERY_POINT)

    respond_to do |format|
      if @mastery_point_info.save
        format.html { redirect_to @mastery_point_info, notice: 'Mastery point info was successfully created.' }
        format.json { render :show, status: :created, location: @mastery_point_info }
      else
        format.html { render :new }
        format.json { render json: @mastery_point_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mastery_point_infos/1
  # PATCH/PUT /mastery_point_infos/1.json
  def update
    respond_to do |format|
      if @mastery_point_info.update(mastery_point_info_params)
        format.html { redirect_to @mastery_point_info, notice: 'Mastery point info was successfully updated.' }
        format.json { render :show, status: :ok, location: @mastery_point_info }
      else
        format.html { render :edit }
        format.json { render json: @mastery_point_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mastery_point_infos/1
  # DELETE /mastery_point_infos/1.json
  def destroy
    @mastery_point_info.destroy
    respond_to do |format|
      format.html { redirect_to mastery_point_infos_url, notice: 'Mastery point info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastery_point_info
      @mastery_point_info = MasteryPointInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastery_point_info_params
      params.require(:mastery_point_info).permit(:MASTERY_POINT, :PRICE_TYPE, :PRICE)
    end
end
