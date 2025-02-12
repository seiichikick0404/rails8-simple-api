class ApplicationController < ActionController::API
    def authenticate
        token = request.headers['Authorization'].split(' ').last
        begin
            decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
            @current_user = User.find(decoded_token[0]['user_id'])
        rescue JWT::DecodeError => e
            render json: { error: 'Invalid token' }, status: :unauthorized
        rescue JWT::ExpiredSignature
            render json: { error: 'Token expired' }, status: :unauthorized
        end
    end
end