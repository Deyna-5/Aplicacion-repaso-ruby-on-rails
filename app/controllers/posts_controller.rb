class PostsController < ApplicationController
       before_action :set_post, only: [:destroy]
       before_action :authenticate_user!

       def index
              @posts = Post.all.order(created_at: :desc)
       end

       def new
              @post = Post.new
       end

       def create
              @post = Post.new(post_params)
              @post.user_id = current_user.id
              if @post.save
                     redirect_to root_path, notice: "Post creado de forma éxitosa"
              else
                     redirect_to root_path, alert: "Ocurrió un error"
              end
       end

       def destroy
              if @post.user_id == current_user.id
                     if @post.destroy
                            redirect_to root_path, notice: "Se elimino de forma éxitosa"
                     else
                            redirect_to root_path, alert: "Ocurrió un error"
                     end
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