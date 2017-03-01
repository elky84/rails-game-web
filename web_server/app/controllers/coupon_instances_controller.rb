class CouponInstancesController < ApplicationController
  before_action :set_coupon_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /coupon_instances
  # GET /coupon_instances.json
  def index
    if params[:search]
      @coupon_instances = CouponInstance.search(params[:search])
    else
      @coupon_instances = CouponInstance.limit(100)
    end
  end

  # GET /coupon_instances/1
  # GET /coupon_instances/1.json
  def show
  end

  # GET /coupon_instances/new
  def new
    @coupon_instance = CouponInstance.new
  end

  # GET /coupon_instances/1/edit
  def edit
  end

  # POST /coupon_instances
  # POST /coupon_instances.json
  def create
    @coupon_instance = create_or_update(:COUPON_INDEX)

    respond_to do |format|
      if @coupon_instance.save
        format.html { redirect_to @coupon_instance, notice: 'Coupon instance was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_instance }
      else
        format.html { render :new }
        format.json { render json: @coupon_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_instances/1
  # PATCH/PUT /coupon_instances/1.json
  def update
    respond_to do |format|
      if @coupon_instance.update(coupon_instance_params)
        format.html { redirect_to @coupon_instance, notice: 'Coupon instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_instance }
      else
        format.html { render :edit }
        format.json { render json: @coupon_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_instances/1
  # DELETE /coupon_instances/1.json
  def destroy
    @coupon_instance.destroy
    respond_to do |format|
      format.html { redirect_to coupon_instances_url, notice: 'Coupon instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_instance
      @coupon_instance = CouponInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_instance_params
      params.require(:coupon_instance).permit(:COUPON_INDEX, :REWARD, :COUPON_STRING, :SERVER_INDEX, :USER_NO, :TIME, :COUPON_GROUP)
    end
end
