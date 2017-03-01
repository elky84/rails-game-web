class ItemEnchantEffectsController < ApplicationController
  before_action :set_item_enchant_effect, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_enchant_effects
  # GET /item_enchant_effects.json
  def index
    if params[:search]
      @item_enchant_effects = ItemEnchantEffect.search(params[:search])
    else
      @item_enchant_effects = ItemEnchantEffect.limit(100)
    end
  end

  # GET /item_enchant_effects/1
  # GET /item_enchant_effects/1.json
  def show
  end

  # GET /item_enchant_effects/new
  def new
    @item_enchant_effect = ItemEnchantEffect.new
  end

  # GET /item_enchant_effects/1/edit
  def edit
  end

  # POST /item_enchant_effects
  # POST /item_enchant_effects.json
  def create
    @item_enchant_effect = create_or_update(:ITEM_ENCHANT_EFFECT_ID)

    respond_to do |format|
      if @item_enchant_effect.save
        format.html { redirect_to @item_enchant_effect, notice: 'Item enchant effect was successfully created.' }
        format.json { render :show, status: :created, location: @item_enchant_effect }
      else
        format.html { render :new }
        format.json { render json: @item_enchant_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_enchant_effects/1
  # PATCH/PUT /item_enchant_effects/1.json
  def update
    respond_to do |format|
      if @item_enchant_effect.update(item_enchant_effect_params)
        format.html { redirect_to @item_enchant_effect, notice: 'Item enchant effect was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_enchant_effect }
      else
        format.html { render :edit }
        format.json { render json: @item_enchant_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_enchant_effects/1
  # DELETE /item_enchant_effects/1.json
  def destroy
    @item_enchant_effect.destroy
    respond_to do |format|
      format.html { redirect_to item_enchant_effects_url, notice: 'Item enchant effect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_enchant_effect
      @item_enchant_effect = ItemEnchantEffect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_enchant_effect_params
      params.require(:item_enchant_effect).permit(:ITEM_ENCHANT_EFFECT_ID, :ITEM_CATEGORY, :LEVEL, :GRADE, :ENCHANT, :BASIC_EFFECT, :BONUS_EFFECT)
    end
end
