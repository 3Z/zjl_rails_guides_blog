class Admin::PhotosController < AdminController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    # puts "---------", plain: @photo.inspect

    if @photo.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

end
