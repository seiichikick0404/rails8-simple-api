class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            token = JWT.encode({ user_id: @user.id }, Rails.application.credentials.secret_key_base, 'HS256')
            render json: { user: { id: @user.id, email: @user.email, token: token }}, status: :ok
        else
            render json: { message: "Invalid credentials" }, status: :unauthorized
        end
    end
end
