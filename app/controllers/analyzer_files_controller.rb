class AnalyzerFilesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_admin

  # GET /analyzer_files
  # GET /analyzer_files.json
  def index
    @analyzer_files = AnalyzerFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analyzer_files }
    end
  end

  # GET /analyzer_files/1
  # GET /analyzer_files/1.json
  def show
    @analyzer_file = AnalyzerFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analyzer_file }
    end
  end

  # GET /analyzer_files/new
  # GET /analyzer_files/new.json
  def new
    @analyzer_file = AnalyzerFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analyzer_file }
    end
  end

  # GET /analyzer_files/1/edit
  def edit
    @analyzer_file = AnalyzerFile.find(params[:id])
  end

  # POST /analyzer_files
  # POST /analyzer_files.json
  def create
    @analyzer_file = AnalyzerFile.new(params[:analyzer_file])

    respond_to do |format|
      if @analyzer_file.save
        format.html { redirect_to @analyzer_file, notice: 'Analyzer file was successfully created.' }
        format.json { render json: @analyzer_file, status: :created, location: @analyzer_file }
      else
        format.html { render action: "new" }
        format.json { render json: @analyzer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analyzer_files/1
  # PUT /analyzer_files/1.json
  def update
    @analyzer_file = AnalyzerFile.find(params[:id])

    respond_to do |format|
      if @analyzer_file.update_attributes(params[:analyzer_file])
        format.html { redirect_to @analyzer_file, notice: 'Analyzer file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analyzer_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyzer_files/1
  # DELETE /analyzer_files/1.json
  def destroy
    @analyzer_file = AnalyzerFile.find(params[:id])
    @analyzer_file.destroy

    respond_to do |format|
      format.html { redirect_to analyzer_files_url }
      format.json { head :no_content }
    end
  end

  private
  def check_admin
    render :file => "#{Rails.root}/public/403.html" unless current_user.admin?
  end
end
