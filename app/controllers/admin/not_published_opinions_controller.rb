class Admin::NotPublishedOpinionsController < ApplicationController
  before_action :set_not_published_opinion, only: [:show, :edit, :update, :destroy]

  # GET /not_published_opinions
  # GET /not_published_opinions.json
  def index
    @not_published_opinions = NotPublishedOpinion.all
  end

  # GET /not_published_opinions/1
  # GET /not_published_opinions/1.json
  def show
  end

  # GET /not_published_opinions/new
  def new
    @not_published_opinion = NotPublishedOpinion.new
  end

  # GET /not_published_opinions/1/edit
  def edit
  end

  # POST /not_published_opinions
  # POST /not_published_opinions.json
  def create
    @not_published_opinion = NotPublishedOpinion.new(not_published_opinion_params)
    respond_to do |format|
      if @not_published_opinion.save
        # Сказать UserMailer отослать приветственное письмо после сохранения
        WpMailer.say_about_new_opinion(@not_published_opinion).deliver_now
        format.html { redirect_to admin_not_published_opinion_path(@not_published_opinion) , notice: 'Not published opinion was successfully created.' }
        format.json { render :show, status: :created, location: @not_published_opinion }
      else
        format.html { render :new }
        format.json { render json: @not_published_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /not_published_opinions/1
  # PATCH/PUT /not_published_opinions/1.json
  def update
    respond_to do |format|
      if @not_published_opinion.update(not_published_opinion_params)
        format.html { redirect_to admin_not_published_opinion_path(@not_published_opinion), notice: 'Not published opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @not_published_opinion }
      else
        format.html { render :edit }
        format.json { render json: @not_published_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /not_published_opinions/1
  # DELETE /not_published_opinions/1.json
  def destroy
    @not_published_opinion.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Not published opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_not_published_opinion
      @not_published_opinion = NotPublishedOpinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def not_published_opinion_params
      params.require(:not_published_opinion).permit(:author, :words, :visit, :email, :phone)
    end
end
