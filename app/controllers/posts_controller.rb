class PostsController < ApplicationController
       before_action :set_post, only: [:destroy]

       def index
              @posts = Post.all.order(created_at: :desc)
       end

       def new
              @post = Post.new
       end

       def create
              @post = Post.new(post_params)
              if @post.save
                     redirect_to root_path, notice: "Post creado de forma éxitosa"
              else
                     redirect_to root_path, alert: "Ocurrió un error"
              end
       end

       def destroy
              if @post.destroy
                     redirect_to root_path, notice: "Se elimino de forma éxitosa"
              else
                     redirect_to root_path, alert: "Ocurrió un error"
              end
       end

       private
              def post_params
                     params.permit(:content, :image_url)
              end

              def set_post
                     @post = Post.find(params[:id])
              end    
end