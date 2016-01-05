class GoalsController < ApplicationController

  before_action :ensure_signed_in, only: [:new]

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to user_goals_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def index
    @user = User.find(params[:user_id])
    @goals = @user.goals
    render :index
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def destroy

  end

  private

  def goal_params
    params.require(:goal).permit(:title, :privacy_setting)
  end
end
