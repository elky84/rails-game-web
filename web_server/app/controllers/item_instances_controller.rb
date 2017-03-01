class ItemInstancesController < ApplicationController
  before_action :set_item_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_instances
  # GET /item_instances.json
  def index
    if params[:search]
      @item_instances = ItemInstance.search(params[:search])
    else
      @item_instances = ItemInstance.limit(100)
    end
  end

  # GET /item_instances/1
  # GET /item_instances/1.json
  def show
  end

  # GET /item_instances/new
  def new
    @item_instance = ItemInstance.new
  end

  # GET /item_instances/1/edit
  def edit
  end

  # POST /item_instances
  # POST /item_instances.json
  def create
    @item_instance = create_or_update(:ITEM_NO)

    respond_to do |format|
      if @item_instance.save
        format.html { redirect_to @item_instance, notice: 'Item instance was successfully created.' }
        format.json { render :show, status: :created, location: @item_instance }
      else
        format.html { render :new }
        format.json { render json: @item_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_instances/1
  # PATCH/PUT /item_instances/1.json
  def update
    respond_to do |format|
      if @item_instance.update(item_instance_params)
        format.html { redirect_to @item_instance, notice: 'Item instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_instance }
      else
        format.html { render :edit }
        format.json { render json: @item_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_instances/1
  # DELETE /item_instances/1.json
  def destroy
    @item_instance.destroy
    respond_to do |format|
      format.html { redirect_to item_instances_url, notice: 'Item instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_instance
      @item_instance = ItemInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_instance_params
      params.require(:item_instance).permit(:ITEM_NO, :ITEM_ID, :USER_NO, :CHARACTER_NO, :START_DATE, :END_DATE, :ITEM_NAME, :LEVEL, :GRADE, :LIMIT, :VALUE, :DEFAULT_OPTION, :OPTION_LIST, :SLOT_TYPE, :EXPIRE_TYPE, :DURABILITY, :ENCHANT)
    end
end
