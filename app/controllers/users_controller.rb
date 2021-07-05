class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user= User.new
  end

  def create
    @user=User.create(params.require(:user).permit(:title,:name,:start,:end))
    if @user.save
      flash[:notice]="スケジュールを新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(params.require(:user).permit(:title,:name,:start,:end))
      flash[:notice]="スケジュールを変更しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:notice]
    redirect_to :users
  end
end
