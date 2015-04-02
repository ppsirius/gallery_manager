class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.order('created_at DESC')
    @images_visible = Image.where(:visible => true).order('created_at DESC')

    respond_to do |format|
      format.html 
      format.json { render :json => @images_visible.to_json(:only => [:name,:description], :methods => [:photo_url_thumb, :photo_url_large]) }
    end
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.create(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
      redirect_to images_url, notice: 'Image was successfully destroyed.' 
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :description, :visible, :photo)
  end

end
