class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:index]
  # GET /goals
  def index
    @goals = Goal.all
  end
  # GET /goals/1
  def show
  end
  # GET /goals/:specialityid/new
  def new
    @goal = Goal.new
  end
  # GET /goals/1/edit
  def edit
  end
  # POST /goals
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id if current_user
    if @goal.save
      redirect_to goals_path, notice: 'Goal was successfully created.'
    else
      redirect_to goals_path, notice: 'Irsyad says no.'
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    redirect_to goals_url, notice: 'Goal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:title, :description, :target_amount, :penalty_amount, :deadline, :user_id, :is_goal_validated, :beneficiary_id)
    end
end
