class Admin::SlaydersController < ApplicationController
  before_action :set_photo_list,          only: [:edit, :new]
  before_action :set_slayder,             only: [:update, :destroy]
  before_action :search_my_group_photo,   only: [:beauty, :edit, :show]
  before_action :update_many_photos_list, only: [:update, :destroy, :create]

  # GET /slayders
  # GET /slayders.json
  def index
    @list_of_slayders = Slayder.all.order(updated_at: :desc)
  end

  # GET /slayders/1
  # GET /slayders/1.json
  def show
  end

  # GET /slayders/new
  def new
    @slayder = Slayder.new
  end

  # GET /slayders/1/edit
  def edit
  end

  # POST /slayders
  # POST /slayders.json
  def create
    @slayder = Slayder.new(slayder_params)
    respond_to do |format|
      if @slayder.save
        format.html { redirect_to admin_slayder_path(@slayder), notice: 'Slayder was successfully created.' }
        format.json { render :show, status: :created, location: @slayder }
      else
        format.html { render :new }
        format.json { render json: @slayder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slayders/1
  # PATCH/PUT /slayders/1.json
  def update
    respond_to do |format|
      if @slayder.update(slayder_params)
        format.html { redirect_to admin_slayder_path(@slayder), notice: 'Slayder was successfully updated.' }
        format.json { render :show, status: :ok, location: @slayder }
      else
        format.html { render :edit }
        format.json { render json: @slayder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slayders/1
  # DELETE /slayders/1.json
  def destroy
    PhotoInSlayder.where(slyder: @slayder.id).each do |trash|
      puts "we delete " + trash.to_s
      trash.destroy
      trash.save
      puts "trash need be destroyed"
      puts trash.to_s
    end
    @slayder.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Slayder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # находит по названию слайдера его ид
  def find_id_slayder( word )
    variant_of_slayders = Slayder.where(title: word)
    if (variant_of_slayders.count != 1)
      return nil
    end
    return variant_of_slayders.first.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slayder
      @slayder = Slayder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slayder_params
      params.require(:slayder).permit(:title)
    end

    def search_my_group_photo
      set_slayder
      @old_list = []
      PhotoInSlayder.where(slyder: @slayder.id).to_a.each do |one_pair|
        @old_list << one_pair.photo
      end
      # теперь в олдлисте только айдишники фоток
    end

    def update_many_photos_list
      if (action_name == 'create')
        @slayder = Slayder.new(slayder_params)
        @slayder.save
        @old_list = []
      else search_my_group_photo
      end
      if (action_name == 'destroy' || params["many_photo_ids"].nil?)
        PhotoInSlayder.where(slyder: @slayder.id).each do |one_pair|
          one_pair.destroy
        end
      else
        new_list = []
        # "word" need == checkbox I parametr without []
        params["many_photo_ids"].each do |one_photo_id|
          new_list << one_photo_id.to_i
        end
        word_list = []
        params["descriptions_to_phinsl"].each do |one_word|
          unless one_word ==""
            word_list << one_word
          end
        end
        puts "word_list = "+word_list.to_s
        create_list =  new_list - @old_list
        delete_list = @old_list -  new_list
        # when you have some problems, uncommented this lines
        # puts "old_list is #{@old_list}"
        # puts "new_list is #{new_list}"
        # puts "create_list is #{create_list}"
        # puts "delete_list is #{delete_list}"
        delete_list.each do |photo_id|
          PhotoInSlayder.where(slyder: @slayder.id, photo: photo_id).each do |one_pair|
            one_pair.destroy
          end
        end
        create_list.each do |photo_id|
          one_pair = PhotoInSlayder.new
          one_pair.photo = photo_id
          one_pair.slyder = @slayder.id
          one_pair.save
        end
        if word_list.count==new_list.count
          # edit (or no) description of ph_in_sl
          # i can work without "n" , using [].index(value) , but this is simple 
          n = 0
          new_list.each do |photo_id|
            one_pair = PhotoInSlayder.where(slyder: @slayder.id, photo: photo_id).first
            unless one_pair.description == word_list[n]
              one_pair.description = word_list[n]
              one_pair.save
            end
            n += 1
          end
        else puts "warning: word_list.count = "+word_list.count.to_s+" but, new_list.count = "+new_list.count.to_s
        end
      end
    end
end
