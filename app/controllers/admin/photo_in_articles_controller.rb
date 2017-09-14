class Admin::PhotoInArticlesController < ApplicationController
  before_action :set_photo_in_article, only: [:show, :edit, :update, :destroy]
  before_action :set_photo_list, only: [:new, :edit]

  # GET /photo_in_articles
  # GET /photo_in_articles.json
  def index
    # @photo_in_articles = PhotoInArticle.all.order(updated_at: :desc)
    redirect_to admin_articles_path
  end

  # GET /photo_in_articles/1
  # GET /photo_in_articles/1.json
  def show
  end

  # GET /photo_in_articles/new
  def new
    @photo_in_article = PhotoInArticle.new
  end

  # GET /photo_in_articles/1/edit
  def edit
  end

  # POST /photo_in_articles
  # POST /photo_in_articles.json
  def create
    @photo_in_article = PhotoInArticle.new(photo_in_article_params)
    respond_to do |format|
      if @photo_in_article.save
        format.html { redirect_to admin_photo_in_article_path(@photo_in_article), notice: 'Photo in article was successfully created.' }
        format.json { render :show, status: :created, location: @photo_in_article }
      else
        format.html { render :new }
        format.json { render json: @photo_in_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_in_articles/1
  # PATCH/PUT /photo_in_articles/1.json
  def update
    respond_to do |format|
      if @photo_in_article.update(photo_in_article_params)
        format.html { redirect_to admin_photo_in_article_path(@photo_in_article), notice: 'Photo in article was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_in_article }
      else
        format.html { render :edit }
        format.json { render json: @photo_in_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_in_articles/1
  # DELETE /photo_in_articles/1.json
  def destroy
    @photo_in_article.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Photo in article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_in_article_params
      params.require(:photo_in_article).permit(:photo, :article)
    end
    
end
