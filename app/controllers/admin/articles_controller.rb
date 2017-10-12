class Admin::ArticlesController < ApplicationController
  before_action :search_my_group_photo,   only: [:beauty, :edit, :show]
  before_action :set_article,             only: [:update, :destroy]
  before_action :update_many_photos_list, only: [:update, :destroy, :create]
  before_action :set_photo_list,          only: [:edit, :new]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order(updated_at: :desc)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/1/prosmotr
  def beauty
    render action: "beauty", layout: "application_guest"
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    # set_article
    # @article = Article.new
    # @article = Article.new(article_params)
    @article.eng_title=Translit.convert(params[:article][:ru_title]).gsub("ü","u")
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.eng_title=Translit.convert(params[:article][:ru_title]).gsub("ü","u")
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_article_path(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      unless params[:eng_title]==nil
        @article = Article.find_by(eng_title: params[:eng_title])
      else
        @article = Article.find(params[:id])
      end
      puts "dog_article = "+ @article.to_s
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:ru_title, :description, :published, :icon)
    end

    def search_my_group_photo
      set_article
      @old_list = []
      PhotoInArticle.where(article: @article.id).to_a.each do |one_pair|
        @old_list << one_pair.photo
      end
      # теперь в олдлисте только айдишники фоток
    end

    def update_many_photos_list
      if (action_name == 'create')
        @article = Article.new(article_params)
        @article.save
        @old_list = []
      else
        search_my_group_photo
      end
      if (action_name == 'destroy' || params["many_photo_ids"].nil?)
        PhotoInArticle.where(article: @article.id).each do |one_pair|
          one_pair.destroy
        end
      else
        new_list = []
        # "word" need == checkbox I parametr without []
        params["many_photo_ids"].each do |one_photo_id|
          new_list << one_photo_id.to_i
        end
        create_list =  new_list - @old_list
        delete_list = @old_list -  new_list
        # when you have some problems, uncommented this lines
        # puts "old_list is #{@old_list}"
        # puts "new_list is #{new_list}"
        # puts "create_list is #{create_list}"
        # puts "delete_list is #{delete_list}"
        delete_list.each do |photo_id|
          PhotoInArticle.where(article: @article.id, photo: photo_id).each do |one_pair|
            one_pair.destroy
          end
        end
        create_list.each do |photo_id|
          one_pair = PhotoInArticle.new
          one_pair.photo = photo_id
          one_pair.article = @article.id
          one_pair.save
        end
      end
    end
end
