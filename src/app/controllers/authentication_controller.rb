class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            payload = { user_id: @user.id, exp: (DateTime.current + 1.minutes).to_i }
            secret_key = Rails.application.credentials.secret_key_base
            token = JWT.encode(payload, secret_key, 'HS256')
            render json: {user: {email: @user.email, token: token, username: @user.name}}, status: :ok
        else
            render json: { message: "Invalid credentials" }, status: :unauthorized
        end
    end
end
