class MonsterGrowsController < ApplicationController
  before_action :set_monster_grow, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /monster_grows
  # GET /monster_grows.json
  def index
    if params[:search]
      @monster_grows = MonsterGrow.search(params[:search])
    else
      @monster_grows = MonsterGrow.limit(100)
    end
  end

  # GET /monster_grows/1
  # GET /monster_grows/1.json
  def show
  end

  # GET /monster_grows/new
  def new
    @monster_grow = MonsterGrow.new
  end

  # GET /monster_grows/1/edit
  def edit
  end

  # POST /monster_grows
  # POST /monster_grows.json
  def create
    @monster_grow = create_or_update(:GROW_ID)

    respond_to do |format|
      if @monster_grow.save
        format.html { redirect_to @monster_grow, notice: 'Monster grow was successfully created.' }
        format.json { render :show, status: :created, location: @monster_grow }
      else
        format.html { render :new }
        format.json { render json: @monster_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_grows/1
  # PATCH/PUT /monster_grows/1.json
  def update
    respond_to do |format|
      if @monster_grow.update(monster_grow_params)
        format.html { redirect_to @monster_grow, notice: 'Monster grow was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_grow }
      else
        format.html { render :edit }
        format.json { render json: @monster_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_grows/1
  # DELETE /monster_grows/1.json
  def destroy
    @monster_grow.destroy
    respond_to do |format|
      format.html { redirect_to monster_grows_url, notice: 'Monster grow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_grow
      @monster_grow = MonsterGrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_grow_params
      params.require(:monster_grow).permit(:GROW_ID, :LEVEL, :GROW_TYPE_DETAIL, :REQUIRE_EXP, :STATUS_ID)
    end
end
