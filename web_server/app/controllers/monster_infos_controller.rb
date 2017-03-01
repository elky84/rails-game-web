class MonsterInfosController < ApplicationController
  before_action :set_monster_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /monster_infos
  # GET /monster_infos.json
  def index
    if params[:search]
      @monster_infos = MonsterInfo.search(params[:search])
    else
      @monster_infos = MonsterInfo.limit(100)
    end
  end

  # GET /monster_infos/1
  # GET /monster_infos/1.json
  def show
  end

  # GET /monster_infos/new
  def new
    @monster_info = MonsterInfo.new
  end

  # GET /monster_infos/1/edit
  def edit
  end

  # POST /monster_infos
  # POST /monster_infos.json
  def create
    @monster_info = create_or_update(:MONSTER_ID)

    respond_to do |format|
      if @monster_info.save
        format.html { redirect_to @monster_info, notice: 'Monster info was successfully created.' }
        format.json { render :show, status: :created, location: @monster_info }
      else
        format.html { render :new }
        format.json { render json: @monster_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_infos/1
  # PATCH/PUT /monster_infos/1.json
  def update
    respond_to do |format|
      if @monster_info.update(monster_info_params)
        format.html { redirect_to @monster_info, notice: 'Monster info was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_info }
      else
        format.html { render :edit }
        format.json { render json: @monster_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_infos/1
  # DELETE /monster_infos/1.json
  def destroy
    @monster_info.destroy
    respond_to do |format|
      format.html { redirect_to monster_infos_url, notice: 'Monster info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_info
      @monster_info = MonsterInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_info_params
      params.require(:monster_info).permit(:MONSTER_ID, :MONSTER_TYPE, :MONSTER_GRADE, :GROW_TYPE, :GROW_TYPE_DETAIL, :MONSTER_PRICE, :ACTOR_ID, :SKIN_NUM, :GACHA_SPEECH)
    end
end
