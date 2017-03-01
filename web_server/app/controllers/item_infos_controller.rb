class ItemInfosController < ApplicationController
  before_action :set_item_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_infos
  # GET /item_infos.json
  def index
    if params[:search]
      @item_infos = ItemInfo.search(params[:search])
    else
      @item_infos = ItemInfo.limit(100)
    end
  end

  # GET /item_infos/1
  # GET /item_infos/1.json
  def show
  end

  # GET /item_infos/new
  def new
    @item_info = ItemInfo.new
  end

  # GET /item_infos/1/edit
  def edit
  end

  # POST /item_infos
  # POST /item_infos.json
  def create
    @item_info = create_or_update(:ITEM_ID)

    respond_to do |format|
      if @item_info.save
        format.html { redirect_to @item_info, notice: 'Item info was successfully created.' }
        format.json { render :show, status: :created, location: @item_info }
      else
        format.html { render :new }
        format.json { render json: @item_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_infos/1
  # PATCH/PUT /item_infos/1.json
  def update
    respond_to do |format|
      if @item_info.update(item_info_params)
        format.html { redirect_to @item_info, notice: 'Item info was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_info }
      else
        format.html { render :edit }
        format.json { render json: @item_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_infos/1
  # DELETE /item_infos/1.json
  def destroy
    @item_info.destroy
    respond_to do |format|
      format.html { redirect_to item_infos_url, notice: 'Item info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_info
      @item_info = ItemInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_info_params
      params.require(:item_info).permit(:ITEM_ID, :ICON, :NAME, :EXPLAIN, :IS_ENCHANT, :IS_REOPTION, :IS_SELL, :LEVEL, :GRADE, :LIMIT, :CATEGORY, :COSTUME_ID, :DEFAULT_OPTION, :ITEM_OPTION_LIST, :PRICE, :VALUE, :EXPIRE_TYPE, :DURABILITY)
    end
end
