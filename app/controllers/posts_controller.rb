class PostsController < ApplicationController

       def index
              @posts = Post.all.order(created_at: :desc)
       end

       def new
              @post = Post.new
       end

       def create
              @post = Post.new(post_params)
              if @post.save
                     redirect_to root_path, notice: "Post creado de forma exitosa"
              else
                     redirect_to root_path, alert: "Hubo un error"
              end
       end

       private
              def post_params
                     params.permit(:content, :image_url)
              end
end