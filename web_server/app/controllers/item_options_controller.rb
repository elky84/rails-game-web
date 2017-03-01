class ItemOptionsController < ApplicationController
  before_action :set_item_option, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_options
  # GET /item_options.json
  def index
    if params[:search]
      @item_options = ItemOption.search(params[:search])
    else
      @item_options = ItemOption.limit(100)
    end
  end

  # GET /item_options/1
  # GET /item_options/1.json
  def show
  end

  # GET /item_options/new
  def new
    @item_option = ItemOption.new
  end

  # GET /item_options/1/edit
  def edit
  end

  # POST /item_options
  # POST /item_options.json
  def create
    @item_option = create_or_update(:ITEM_OPTION_ID)

    respond_to do |format|
      if @item_option.save
        format.html { redirect_to @item_option, notice: 'Item option was successfully created.' }
        format.json { render :show, status: :created, location: @item_option }
      else
        format.html { render :new }
        format.json { render json: @item_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_options/1
  # PATCH/PUT /item_options/1.json
  def update
    respond_to do |format|
      if @item_option.update(item_option_params)
        format.html { redirect_to @item_option, notice: 'Item option was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_option }
      else
        format.html { render :edit }
        format.json { render json: @item_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_options/1
  # DELETE /item_options/1.json
  def destroy
    @item_option.destroy
    respond_to do |format|
      format.html { redirect_to item_options_url, notice: 'Item option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_option
      @item_option = ItemOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_option_params
      params.require(:item_option).permit(:ITEM_OPTION_ID, :OPTION_ID, :DESCRIPTION, :GRADE, :DETAIL_ID, :MIN, :MAX)
    end
end
