class ImagesController < ApplicationController
  include Previewable

  def show
    @images = Image.find(params[:id])
    @thumbnail = thumbnail(@image)
  end
end
