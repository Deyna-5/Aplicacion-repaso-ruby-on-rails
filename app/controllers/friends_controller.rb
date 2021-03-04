class FriendsController < ApplicationController

       def create
              @friend = Friend.new(:user_id => current_user.id, :friend_id => params[:friend_id])

              if @friend.save
                     redirect_to root_path, notice: "Empezaste a seguir a un usuario"
              else
                     redirect_to root_path, alert: "Ocurrió un error (follow method)"
              end
       end

       def destroy
              @friend = Friend.find_by(user_id: current_user.id, friend_id: params[:id])

              if @friend.destroy
                     redirect_to root_path, notice: "Dejaste de seguir a un usuario"
              else
                     redirect_to root_path, alert: "Ocurrió un error (unfollow method)"
              end

       end
end