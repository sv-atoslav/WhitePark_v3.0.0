class Admin::OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy, :become_public]

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.order(published: :asc).order(updated_at: :desc)
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  def new_from_guest
  end

  # GET /opinions/1/edit
  def edit
  end

  def become_public
    @opinion.published  = true
    @opinion.save
    redirect_to action: "index"
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)
    respond_to do |format|
      if @opinion.save
        format.html { redirect_to action: "index", notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to admin_opinion_path(@opinion), notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:author, :email, :phone, :visit, :words, :published)
    end
end
