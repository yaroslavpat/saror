class UploadController < ApplicationController
  def get
    @file = File.new
  end
  def save
    @file = File.new(params[:file])
    if @file.save
      redirect_to(action: 'show', id: @file.id)
    else
      render(action: :get)
    end
  end
  def file
    @file = File.find(params[:id])
    send_data(@File.data,
              filename: @File.name,
              disposition: "inline")
  end
  def show
    @file = File.find(params[:id])
  end
end
