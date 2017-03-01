class ItemEnchantsController < ApplicationController
  before_action :set_item_enchant, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_enchants
  # GET /item_enchants.json
  def index
    if params[:search]
      @item_enchants = ItemEnchant.search(params[:search])
    else
      @item_enchants = ItemEnchant.limit(100)
    end
  end

  # GET /item_enchants/1
  # GET /item_enchants/1.json
  def show
  end

  # GET /item_enchants/new
  def new
    @item_enchant = ItemEnchant.new
  end

  # GET /item_enchants/1/edit
  def edit
  end

  # POST /item_enchants
  # POST /item_enchants.json
  def create
    @item_enchant = create_or_update(:ITEM_ENCHANT_ID)

    respond_to do |format|
      if @item_enchant.save
        format.html { redirect_to @item_enchant, notice: 'Item enchant was successfully created.' }
        format.json { render :show, status: :created, location: @item_enchant }
      else
        format.html { render :new }
        format.json { render json: @item_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_enchants/1
  # PATCH/PUT /item_enchants/1.json
  def update
    respond_to do |format|
      if @item_enchant.update(item_enchant_params)
        format.html { redirect_to @item_enchant, notice: 'Item enchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_enchant }
      else
        format.html { render :edit }
        format.json { render json: @item_enchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_enchants/1
  # DELETE /item_enchants/1.json
  def destroy
    @item_enchant.destroy
    respond_to do |format|
      format.html { redirect_to item_enchants_url, notice: 'Item enchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_enchant
      @item_enchant = ItemEnchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_enchant_params
      params.require(:item_enchant).permit(:ITEM_ENCHANT_ID, :ITEM_CATEGORY, :LEVEL, :GRADE, :ENCHANT, :ENCHANT_PROBABILITY, :MONEY)
    end
end
