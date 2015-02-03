class PhotosController < ApplicationController

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = params[:user_id]

    # puts "---------", plain: @photo.inspect

    if @photo.save
      redirect_to user_path(@photo.user_id)
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

end
