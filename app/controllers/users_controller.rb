class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
