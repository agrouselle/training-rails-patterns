class PostsController < ApplicationController
  include Previewable

  def show
    @post = Post.find(params[:id])
    @thumbnail = thumbnail(@post)
  end
end
