class UserTablesController < ApplicationController
  before_action :set_user_table, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @user_tables = UserTable.all
    respond_with(@user_tables)
  end

  def show
    respond_with(@user_table)
  end

  def create
    @user_table = UserTable.new(user_table_params)
    @user_table.save
    respond_with(@user_table)
  end

  def update
    @user_table.update(user_table_params)
    respond_with(@user_table)
  end

  def destroy
    @user_table.destroy
    respond_with(@user_table)
  end

  private
    def set_user_table
      @user_table = UserTable.find(params[:id])
    end

    def user_table_params
      params.require(:user_table).permit(:user_name, :user_mail, :user_password, :user_rol, :user_cargo)
    end
end
