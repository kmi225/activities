class ActivityController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @activities = Activity.all
    json_response(@activities)
  end

  def create
    @activity = Activity.create!(todo_params)
    json_response(@activity, :created)
  end

  # GET /todos/:id
  def show
    json_response(@activity)
  end

  private

  def activity_params
    # whitelist params
    params.permit(:activity_id, :name)
  end

  def set_activity
    @activity = Activity.find(pasrams[:activity_id])
  end

end
