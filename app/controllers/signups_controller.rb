class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    render json: Signup.all
  end

  def create
    signup = Signup.create!(signup_params)
    render json: signup.activity, status: :created
  end

  def destroy
    signup = find_signup
    signup.destroy
    head :no_content
  end

  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end

  def find_signup
    Signup.find(params[:id])
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end


end
