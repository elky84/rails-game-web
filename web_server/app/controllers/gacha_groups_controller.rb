class GachaGroupsController < ApplicationController
  before_action :set_gacha_group, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /gacha_groups
  # GET /gacha_groups.json
  def index
    if params[:search]
      @gacha_groups = GachaGroup.search(params[:search])
    else
      @gacha_groups = GachaGroup.limit(100)
    end
  end

  # GET /gacha_groups/1
  # GET /gacha_groups/1.json
  def show
  end

  # GET /gacha_groups/new
  def new
    @gacha_group = GachaGroup.new
  end

  # GET /gacha_groups/1/edit
  def edit
  end

  # POST /gacha_groups
  # POST /gacha_groups.json
  def create
    @gacha_group = create_or_update(:GACHA_GROUP_ID)

    respond_to do |format|
      if @gacha_group.save
        format.html { redirect_to @gacha_group, notice: 'Gacha group was successfully created.' }
        format.json { render :show, status: :created, location: @gacha_group }
      else
        format.html { render :new }
        format.json { render json: @gacha_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gacha_groups/1
  # PATCH/PUT /gacha_groups/1.json
  def update
    respond_to do |format|
      if @gacha_group.update(gacha_group_params)
        format.html { redirect_to @gacha_group, notice: 'Gacha group was successfully updated.' }
        format.json { render :show, status: :ok, location: @gacha_group }
      else
        format.html { render :edit }
        format.json { render json: @gacha_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gacha_groups/1
  # DELETE /gacha_groups/1.json
  def destroy
    @gacha_group.destroy
    respond_to do |format|
      format.html { redirect_to gacha_groups_url, notice: 'Gacha group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gacha_group
      @gacha_group = GachaGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gacha_group_params
      params.require(:gacha_group).permit(:GACHA_GROUP_ID, :GROUP_REWARD, :DESCRIPTION)
    end
end
