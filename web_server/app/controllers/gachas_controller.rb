class GachasController < ApplicationController
  before_action :set_gacha, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /gachas
  # GET /gachas.json
  def index
    if params[:search]
      @gachas = Gacha.search(params[:search])
    else
      @gachas = Gacha.limit(100)
    end
  end

  # GET /gachas/1
  # GET /gachas/1.json
  def show
  end

  # GET /gachas/new
  def new
    @gacha = Gacha.new
  end

  # GET /gachas/1/edit
  def edit
  end

  # POST /gachas
  # POST /gachas.json
  def create
    @gacha = create_or_update(:GACHA_ID)

    respond_to do |format|
      if @gacha.save
        format.html { redirect_to @gacha, notice: 'Gacha was successfully created.' }
        format.json { render :show, status: :created, location: @gacha }
      else
        format.html { render :new }
        format.json { render json: @gacha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gachas/1
  # PATCH/PUT /gachas/1.json
  def update
    respond_to do |format|
      if @gacha.update(gacha_params)
        format.html { redirect_to @gacha, notice: 'Gacha was successfully updated.' }
        format.json { render :show, status: :ok, location: @gacha }
      else
        format.html { render :edit }
        format.json { render json: @gacha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gachas/1
  # DELETE /gachas/1.json
  def destroy
    @gacha.destroy
    respond_to do |format|
      format.html { redirect_to gachas_url, notice: 'Gacha was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gacha
      @gacha = Gacha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gacha_params
      params.require(:gacha).permit(:GACHA_ID, :GACHA_MACHINE_TYPE, :GROUP_ID, :REWARD_PROBABILITY, :GACHA_NAME)
    end
end
