class Admin::CategoryEventsController < ApplicationController 
  before_action :set_category_event,    only: [:edit, :update, :destroy]
  before_action :search_my_group_event, only: [:show, :beauty]
  before_action :set_photo_list,        only: [:edit, :new]

  # GET /category_events
  # GET /category_events.json
  def index
    @category_events = CategoryEvent.all.order(updated_at: :desc)
  end

  # GET /category_events/1
  # GET /category_events/1.json
  def show
  end

  def beauty
    render action: "beauty", layout: "application_guest"
  end

  # GET /category_events/new
  def new
    @category_event = CategoryEvent.new
  end

  # GET /category_events/1/edit
  def edit
  end

  # POST /category_events
  # POST /category_events.json
  def create
    # set_category_event 
    # @category_event = CategoryEvent.new
    @category_event = CategoryEvent.new(category_event_params)
    @category_event.eng_title=Translit.convert(params[:category_event][:ru_title])
    respond_to do |format|
      if @category_event.save
        format.html { redirect_to admin_category_event_path(@category_event), notice: 'Category event was successfully created.' }
        format.json { render :show, status: :created, location: @category_event }
      else
        format.html { render :new }
        format.json { render json: @category_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_events/1
  # PATCH/PUT /category_events/1.json
  def update
    @category_event.eng_title=Translit.convert(params[:category_event][:ru_title])
    respond_to do |format|
      if @category_event.update(category_event_params)
        format.html { redirect_to admin_category_event_path(@category_event), notice: 'Category event was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_event }
      else
        format.html { render :edit }
        format.json { render json: @category_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_events/1
  # DELETE /category_events/1.json
  def destroy
    Event.where(category: @category_event.id).to_a.each do |one_event|
      one_event.destroy
    end
    @category_event.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Category event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_event
      unless params[:eng_title]==nil
        @category_event = CategoryEvent.find_by(eng_title: params[:eng_title])
      else
        @category_event = CategoryEvent.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_event_params
      params.require(:category_event).permit(:ru_title, :description, :icon)
    end

    def search_my_group_event
      set_category_event
      @old_list = []
      Event.where(category: @category_event.id).to_a.each do |one_event|
        puts one_event
        @old_list.push(one_event.id)
        puts @old_list
      end
    end
end
