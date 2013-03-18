class DataSetsController < ApplicationController
  def index
    @data_sets = DataSet.all

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @data_sets }
    end
  end
  def new
    @data_set = DataSet.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @data_set }
    end
  end
  def create
    @data_set = DataSet.new(params[:data_set])

    respond_to do |format|
      if @data_set.save
        format.html  { redirect_to(@data_set,
                                   :notice => 'DataSet was successfully created.') }
        format.json  { render :json => @data_set,
                              :status => :created, :location => @data_set }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @data_set.errors,
                              :status => :unprocessable_entity }
      end
    end
  end
  def show
    @data_set = DataSet.find(params[:id])

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @data_set }
    end
  end
  def edit
    @data_set = DataSet.find(params[:id])
  end
  def update
    @data_set = DataSet.find(params[:id])

    respond_to do |format|
      if @data_set.update_attributes(params[:data_set])
        format.html  { redirect_to(@data_set,
                                   :notice => 'DataSet was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @data_set.errors,
                              :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @data_set = DataSet.find(params[:id])
    @data_set.destroy

    respond_to do |format|
      format.html { redirect_to data_sets_url }
      format.json { head :no_content }
    end
  end
end
