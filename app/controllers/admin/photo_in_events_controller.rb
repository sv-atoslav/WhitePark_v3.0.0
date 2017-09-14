class Admin::PhotoInEventsController < ApplicationController
  before_action :set_photo_in_event, only: [:show, :edit, :update, :destroy]
  before_action :set_photo_list, only: [:new, :edit]

  # GET /photo_in_events
  # GET /photo_in_events.json
  def index
    # @photo_in_events = PhotoInEvent.all.order(updated_at: :desc)
    redirect_to admin_events_path
  end

  # GET /photo_in_events/1
  # GET /photo_in_events/1.json
  def show
  end

  # GET /photo_in_events/new
  def new
    @photo_in_event = PhotoInEvent.new
  end

  # GET /photo_in_events/1/edit
  def edit
  end

  # POST /photo_in_events
  # POST /photo_in_events.json
  def create
    @photo_in_event = PhotoInEvent.new(photo_in_event_params)

    respond_to do |format|
      if @photo_in_event.save
        format.html { redirect_to admin_photo_in_event_path(@photo_in_event), notice: 'Photo in event was successfully created.' }
        format.json { render :show, status: :created, location: @photo_in_event }
      else
        format.html { render :new }
        format.json { render json: @photo_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_in_events/1
  # PATCH/PUT /photo_in_events/1.json
  def update
    respond_to do |format|
      if @photo_in_event.update(photo_in_event_params)
        format.html { redirect_to admin_photo_in_event_path(@photo_in_event), notice: 'Photo in event was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_in_event }
      else
        format.html { render :edit }
        format.json { render json: @photo_in_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_in_events/1
  # DELETE /photo_in_events/1.json
  def destroy
    @photo_in_event.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Photo in event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_in_event
      @photo_in_event = PhotoInEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_in_event_params
      params.require(:photo_in_event).permit(:photo, :event)
    end
end
