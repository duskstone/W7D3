class UsersController < ApplicationController

    def create #
        @user = User.new(user_params)

        if @user.save
            return 
        else 
            @user.errors.full_messages
            return 
        end 
    end

    def user_params 
        params.require(:user).permit(:username, :password)
    end 
end
