class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if user_signed_in?
        @post = Post.friendly.find(params[:id])
      else
        @post = Post.friendly.published.find(params[:id])
      end
    end
end
