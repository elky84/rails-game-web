class MasteryInfosController < ApplicationController
  before_action :set_mastery_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /mastery_infos
  # GET /mastery_infos.json
  def index
    if params[:search]
      @mastery_infos = MasteryInfo.search(params[:search])
    else
      @mastery_infos = MasteryInfo.limit(100)
    end
  end

  # GET /mastery_infos/1
  # GET /mastery_infos/1.json
  def show
  end

  # GET /mastery_infos/new
  def new
    @mastery_info = MasteryInfo.new
  end

  # GET /mastery_infos/1/edit
  def edit
  end

  # POST /mastery_infos
  # POST /mastery_infos.json
  def create
    @mastery_info = create_or_update(:MASTERY_ID)

    respond_to do |format|
      if @mastery_info.save
        format.html { redirect_to @mastery_info, notice: 'Mastery info was successfully created.' }
        format.json { render :show, status: :created, location: @mastery_info }
      else
        format.html { render :new }
        format.json { render json: @mastery_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mastery_infos/1
  # PATCH/PUT /mastery_infos/1.json
  def update
    respond_to do |format|
      if @mastery_info.update(mastery_info_params)
        format.html { redirect_to @mastery_info, notice: 'Mastery info was successfully updated.' }
        format.json { render :show, status: :ok, location: @mastery_info }
      else
        format.html { render :edit }
        format.json { render json: @mastery_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mastery_infos/1
  # DELETE /mastery_infos/1.json
  def destroy
    @mastery_info.destroy
    respond_to do |format|
      format.html { redirect_to mastery_infos_url, notice: 'Mastery info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastery_info
      @mastery_info = MasteryInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastery_info_params
      params.require(:mastery_info).permit(:MASTERY_ID, :MASTERY_TYPE, :GRADE, :NAME, :EXPLAIN, :MAX_LEVEL, :OPTION_ID, :OPTION_EFFECT, :EFFECT_TARGET, :PRE_LEVEL, :PRE_CONDITION, :ICON)
    end
end
