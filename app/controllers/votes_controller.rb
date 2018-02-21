class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voting
  before_action :set_meals_list, only: [:new]

  def index
    return if @voting.nil?
    get_votes_service = GetTotalVotesForMealService.new(@voting.contract_address)
    @meal_votes = @voting.meals.map do |meal|
      [meal, get_votes_service.call(meal)]
    end.to_h
  end

  def new
    return if @voting.nil?
  end

  def create
    if vote_params[:private_key].length == 64
      VoteService.new(vote_params[:private_key], vote_params[:meals]).call

      redirect_to :votes
    else
      set_meals_list
      flash.now[:alert] = 'Invalid private key!'
      render :new
    end
  end

  private

  def set_meals_list
    @meals_list = @voting.meals
  end

  def set_voting
    @voting = Voting.last
  end

  def vote_params
    params.require(:votes).permit(:private_key, meals: [])
  end
end
