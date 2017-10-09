class Admin::PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_photo_list, only: [:index]

  # GET /photos
  # GET /photos.json
  def index
    # @good_photos = []
    # @bad_photos  = []
    # # todo - have ph. data on server or haven't
    # @photo_list.each do |one_photo|
    #   if one_photo.avatar.exists?
    #     @good_photos<< one_photo
    #   else
    #     @bad_photos << one_photo
    #   end
    # end
    # code under this sort it is simplifily solutions, but i get nil or error
    # @photo_list.to_a.group_by {|one_photo| one_photo.avatar.exists? ? :good_photos : :bad_photos}
    # @good_photos = :good_photos.to_a
    # @bad_photos  =  :bad_photos.to_a
    # puts "g phs" + @good_photos.to_a.to_s
    # puts "b phs" +  @bad_photos.to_s.to_s
    # @good_photos = @photo_list.where("avatar.exists?" true)
    # @bad_photos  = @photo_list.where("avatar.exists?" true)
    # @good_photos = Photo.where("avatar.exists?" => true)
    # @bad_photos  = Photo.where("avatar.exists?" => false)
    # puts "g phs" + @good_photos.to_a.to_s
    # puts "b phs" +  @bad_photos.to_s.to_s
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to admin_photo_path(@photo), notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to admin_photo_path(@photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    list_to_destroy =[]
    list_to_destroy += PhotoInEvent.where(  photo: @photo.id).all.to_a
    list_to_destroy += PhotoInArticle.where(photo: @photo.id).all.to_a
    list_to_destroy += PhotoInSlayder.where(photo: @photo.id).all.to_a
    list_to_destroy.each do |item|
      item.destroy
    end
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:description, :avatar)
    end

    def upload
      uploaded_io = params[:person][:picture]
      File.open(Rails.root.join('assets', 'wpimg', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
    
end
