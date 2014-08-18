class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all.reverse
    redirect_to login_path if !current_user
  end

  def new
    @photo = Photo.new
    redirect_to login_path if !current_user
  end

  def create
    @photo = current_user.photos.new(photo_params)
    @photo.date ||= DateTime.now
    redirect_to login_path if !current_user

    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def show

  end

  private
  
  def photo_params
    params.require(:photo).permit(:image, :content)
  end
end
