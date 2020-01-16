class UserTablesController < ApplicationController
  before_action :set_user_table, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @user_tables = UserTable.all
    render json: @user_tables
  end

  def show
    render json: @user_tables
  end

  def veri
    @respt  = UserTable.verification(params[:user_mail])
    render json: @respt
  end

  def create
    @user_table = UserTable.new(user_table_params)
    @user_table.save
    render json: @user_tables
  end

  def update
    @user_table.update(user_table_params)
    render json: @user_tables
  end

  def destroy
    @user_table.destroy
    render json: @user_tables
  end

  private
    def set_user_table
      @user_table = UserTable.find(params[:id])
    end

    def user_table_params
      params.require(:user_table).permit(:user_name, :user_mail, :user_password, :user_rol, :user_cargo)
    end
end
