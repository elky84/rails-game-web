class QuestInfosController < ApplicationController
  before_action :set_quest_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /quest_infos
  # GET /quest_infos.json
  def index
    if params[:search]
      @quest_infos = QuestInfo.search(params[:search])
    else
      @quest_infos = QuestInfo.limit(100)
    end
  end

  # GET /quest_infos/1
  # GET /quest_infos/1.json
  def show
  end

  # GET /quest_infos/new
  def new
    @quest_info = QuestInfo.new
  end

  # GET /quest_infos/1/edit
  def edit
  end

  # POST /quest_infos
  # POST /quest_infos.json
  def create
    @quest_info = create_or_update(:QUEST_INFO_ID)

    respond_to do |format|
      if @quest_info.save
        format.html { redirect_to @quest_info, notice: 'Quest info was successfully created.' }
        format.json { render :show, status: :created, location: @quest_info }
      else
        format.html { render :new }
        format.json { render json: @quest_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_infos/1
  # PATCH/PUT /quest_infos/1.json
  def update
    respond_to do |format|
      if @quest_info.update(quest_info_params)
        format.html { redirect_to @quest_info, notice: 'Quest info was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_info }
      else
        format.html { render :edit }
        format.json { render json: @quest_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_infos/1
  # DELETE /quest_infos/1.json
  def destroy
    @quest_info.destroy
    respond_to do |format|
      format.html { redirect_to quest_infos_url, notice: 'Quest info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_info
      @quest_info = QuestInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_info_params
      params.require(:quest_info).permit(:QUEST_INFO_ID, :QUEST_APPLY_TYPE, :GROUP_ID, :LEVEL_LIMIT, :NEXT_QUEST_ID, :QUEST_SCHEDULE_ID, :QUEST_TYPE_ID, :QUEST_GRADE_TYPE, :GRADE, :PREVIEW, :MAXVALUE, :REWARD, :SHORT_CUT, :COMPLETE_IMAGE, :COMPLETE_SCENE, :COMPLETE_EXPLAN)
    end
end
