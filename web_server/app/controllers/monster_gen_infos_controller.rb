class MonsterGenInfosController < ApplicationController
  before_action :set_monster_gen_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /monster_gen_infos
  # GET /monster_gen_infos.json
  def index
    if params[:search]
      @monster_gen_infos = MonsterGenInfo.search(params[:search])
    else
      @monster_gen_infos = MonsterGenInfo.limit(100)
    end
  end

  # GET /monster_gen_infos/1
  # GET /monster_gen_infos/1.json
  def show
  end

  # GET /monster_gen_infos/new
  def new
    @monster_gen_info = MonsterGenInfo.new
  end

  # GET /monster_gen_infos/1/edit
  def edit
  end

  # POST /monster_gen_infos
  # POST /monster_gen_infos.json
  def create
    @monster_gen_info = create_or_update(:INDEX)

    respond_to do |format|
      if @monster_gen_info.save
        format.html { redirect_to @monster_gen_info, notice: 'Monster gen info was successfully created.' }
        format.json { render :show, status: :created, location: @monster_gen_info }
      else
        format.html { render :new }
        format.json { render json: @monster_gen_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_gen_infos/1
  # PATCH/PUT /monster_gen_infos/1.json
  def update
    respond_to do |format|
      if @monster_gen_info.update(monster_gen_info_params)
        format.html { redirect_to @monster_gen_info, notice: 'Monster gen info was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_gen_info }
      else
        format.html { render :edit }
        format.json { render json: @monster_gen_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_gen_infos/1
  # DELETE /monster_gen_infos/1.json
  def destroy
    @monster_gen_info.destroy
    respond_to do |format|
      format.html { redirect_to monster_gen_infos_url, notice: 'Monster gen info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_gen_info
      @monster_gen_info = MonsterGenInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_gen_info_params
      params.require(:monster_gen_info).permit(:INDEX, :APPEAR_TYPE, :POSITION, :MOVE_FROM, :DIRECTION, :CURVE, :JUMP_SPEED, :DEAD_AFTER_APPEAR)
    end
end
