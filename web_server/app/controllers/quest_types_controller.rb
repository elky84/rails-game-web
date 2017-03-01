class QuestTypesController < ApplicationController
  before_action :set_quest_type, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /quest_types
  # GET /quest_types.json
  def index
    if params[:search]
      @quest_types = QuestType.search(params[:search])
    else
      @quest_types = QuestType.limit(100)
    end
  end

  # GET /quest_types/1
  # GET /quest_types/1.json
  def show
  end

  # GET /quest_types/new
  def new
    @quest_type = QuestType.new
  end

  # GET /quest_types/1/edit
  def edit
  end

  # POST /quest_types
  # POST /quest_types.json
  def create
    @quest_type = create_or_update(:QUEST_TYPE_ID)

    respond_to do |format|
      if @quest_type.save
        format.html { redirect_to @quest_type, notice: 'Quest type was successfully created.' }
        format.json { render :show, status: :created, location: @quest_type }
      else
        format.html { render :new }
        format.json { render json: @quest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_types/1
  # PATCH/PUT /quest_types/1.json
  def update
    respond_to do |format|
      if @quest_type.update(quest_type_params)
        format.html { redirect_to @quest_type, notice: 'Quest type was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_type }
      else
        format.html { render :edit }
        format.json { render json: @quest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_types/1
  # DELETE /quest_types/1.json
  def destroy
    @quest_type.destroy
    respond_to do |format|
      format.html { redirect_to quest_types_url, notice: 'Quest type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_type
      @quest_type = QuestType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_type_params
      params.require(:quest_type).permit(:QUEST_TYPE_ID, :QUEST_ICON, :TYPE, :QUEST_NAME, :QUEST_EXPLAIN, :GUIDE_CHAR_IMAGE, :QUEST_COMPLETE_EXPLAIN)
    end
end
