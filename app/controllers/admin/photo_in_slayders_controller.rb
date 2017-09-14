class Admin::PhotoInSlaydersController < ApplicationController
  before_action :set_photo_in_slayder, only: [:show, :edit, :update, :destroy]
  before_action :set_photo_list, only: [:new, :edit]

  # GET /photo_in_slayders
  # GET /photo_in_slayders.json
  def index
    # @list_of_slayders = Slayder.all
    redirect_to admin_slayders_path
  end

  # GET /photo_in_slayders/1
  # GET /photo_in_slayders/1.json
  def show
  end

  # GET /photo_in_slayders/new
  def new
    @photo_in_slayder = PhotoInSlayder.new
  end

  # GET /photo_in_slayders/1/edit
  def edit
  end

  # POST /photo_in_slayders
  # POST /photo_in_slayders.json
  def create
    @photo_in_slayder = PhotoInSlayder.new(photo_in_slayder_params)

    respond_to do |format|
      if @photo_in_slayder.save
        format.html { redirect_to admin_photo_in_slayder_path(@photo_in_slayder), notice: 'Photo in slayder was successfully created.' }
        format.json { render :show, status: :created, location: @photo_in_slayder }
      else
        format.html { render :new }
        format.json { render json: @photo_in_slayder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_in_slayders/1
  # PATCH/PUT /photo_in_slayders/1.json
  def update
    respond_to do |format|
      if @photo_in_slayder.update(photo_in_slayder_params)
        format.html { redirect_to admin_photo_in_slayder_path(@photo_in_slayder), notice: 'Photo in slayder was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_in_slayder }
      else
        format.html { render :edit }
        format.json { render json: @photo_in_slayder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_in_slayders/1
  # DELETE /photo_in_slayders/1.json
  def destroy
    @photo_in_slayder.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Photo in slayder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_in_slayder
      @photo_in_slayder = PhotoInSlayder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_in_slayder_params
      params.require(:photo_in_slayder).permit(:photo, :slyder, :description)
    end
end
