class Admin::EventsController < ApplicationController
  before_action :set_photo_list,          only: [:edit, :new]
  before_action :set_event,               only: [:update, :destroy]
  before_action :search_my_group_photo,   only: [:beauty, :edit, :show]
  before_action :update_many_photos_list, only: [:update, :destroy, :create]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(updated_at: :desc)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/1/prosmotr
  def beauty
    render action: "beauty", layout: "application_guest"
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    # set_event 
    # @event  = CategoryEvent.new
    # @event  = CategoryEvent.new(article_params)
    @event.eng_title=Translit.convert(params[:event][:ru_title])
    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event.eng_title=Translit.convert(params[:event][:ru_title])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      unless params[:eng_title]==nil
        @event = Event.find_by(eng_title: params[:eng_title])
      else
        @event = Event.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:category, :ru_title, :description, :icon)
    end

    def search_my_group_photo
      set_event
      @old_list = []
      PhotoInEvent.where(event: @event.id).each do |one_pair|
        @old_list << one_pair.photo
      end
      # теперь в олдлисте только айдишники фоток
    end

    def update_many_photos_list
      if (action_name == 'create')
        @event = Event.new(event_params)
        @event.save
        @old_list = []
      else
        search_my_group_photo
      end
      if (action_name == 'destroy' || params["many_photo_ids"].nil?)
        PhotoInEvent.where(event: @event.id).each do |one_pair|
          one_pair.destroy
        end
      else
        new_list = []
        # "wodr" need == checkbox I parametr without []
        params["many_photo_ids"].each do |one_photo_id|
          new_list << one_photo_id.to_i
        end
        create_list =  new_list - @old_list
        delete_list = @old_list -  new_list
        # when you have some problems, un commented this lines
        # puts "old_list is #{@old_list}"
        # puts "new_list is #{new_list}"
        # puts "create_list is #{create_list}"
        # puts "delete_list is #{delete_list}"
        delete_list.each do |photo_id|
          PhotoInEvent.where(event: @event.id, photo: photo_id).each do |one_pair|
            one_pair.destroy
          end
        end
        create_list.each do |photo_id|
          one_pair = PhotoInEvent.new
          one_pair.photo = photo_id
          one_pair.event = @event.id
          one_pair.save
        end
      end
    end
end
