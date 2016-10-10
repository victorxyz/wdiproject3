class PledgesController < ApplicationController
  before_action :set_pledge, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:index]
  # GET /pledge
  def index
    @pledges = Pledge.all
  end
  # GET /pledge/1
  def show
  end
  # GET /pledge/:specialityid/new
  def new
    @pledge = Pledge.new
    @goals = Goal.where(id: params[:id])
    @id = params[:id]
  end
  # GET /pledge/1/edit
  def edit
  end
  # POST /pledge
  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id if current_user
    if @pledge.save
      redirect_to goals_path, notice: 'pledge was successfully created.'
    else
      @goals = Goal.where(id: @pledge.goal.id)
      render :new
    end
  end

  # PATCH/PUT /pledge/1
  def update
    if @pledge.update(pledge_params)

      redirect_to @pledge, notice: 'pledge was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pledge/1
  def destroy
    @pledge.destroy
    redirect_to pledge_url, notice: 'pledge was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledge
      @pledge = Pledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledge_params
      params.require(:pledge).permit(:amount, :goal_id)
    end

end
