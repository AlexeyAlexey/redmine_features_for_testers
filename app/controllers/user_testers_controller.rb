class UserTestersController < ApplicationController
  unloadable
  before_filter :require_admin
  

  def index
  end

  def edit
  end

  def new
    @user = User.find_by_id params["user_id"]
    @user_tester = @user.build_user_tester
  end

  def create
    @user = User.find_by_id params["user_tester"]["user_id"]
    @user_tester = @user.build_user_tester

    byebug
    @user_tester.ciphered_password = params["user_tester"]["ciphered_password"]
    @user_tester.save

    respond_to do |format|
      if @user_tester.errors.any?
        format.html{redirect_to :back, flash: {error: @user_tester.errors.full_messages.join(', ')}}
      else
        format.html{redirect_to :back, notice: "succes"}
      end
      
    end
  end

  def update
  end

  def destroy
  end
end
