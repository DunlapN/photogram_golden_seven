class PhotosController < ApplicationController

  # CREATE
  def new_form

    render("/photos/new_form.html.erb")
  end

  def create_row
    new_photo = Photo.new
    new_photo.caption = params[:the_caption]
    new_photo.source = params[:the_source]
    new_photo.save
    redirect_to("http://localhost:3000/photos")
  end

  # edit
  def edit_form
    @photo = Photo.find(params[:id])
    render ("/photos/edit_form.html.erb")
  end

  def update_row
    photo = Photo.find(params[:id])
    photo.caption = params[:the_caption]
    photo.source = params[:the_source]
    photo.save
    redirect_to("http://localhost:3000/photos")
  end

  # READ
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])

    render("/photos/show.html.erb")
  end

  #DELETE

  def destroy
    photo = Photo.find(params[:id])
    photo.delete
    redirect_to("http://localhost:3000/photos")

  end


end
