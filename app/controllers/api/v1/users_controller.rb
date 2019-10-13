class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create, :sign_in ]

  def create
  end

  def sign_in
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: { errors: ['ログインに失敗しました'] }, status: 401
    end
  end
end
