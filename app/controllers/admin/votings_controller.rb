class Admin::VotingsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_data, only: [:new]

  MEALS = ['Pizza', 'Chinese', 'Burger', 'Thai', 'Vietnam', 'Georgian', 'Salads'].freeze

  def create
    if voting_params[:private_key].length == 64
      users = User.where(id: voting_params[:users])
      meals = voting_params[:meals]
      addresses = users.map(&:wallet_address)
      address = Contract::DeployService.new(addresses, meals, voting_params[:private_key]).call
      Voting.create(contract_address: address, meals: meals, users: users)

      redirect_to :root
    else
      set_data
      flash.now[:alert] = 'Invalid private key!'
      render :new
    end
  end

  private

  def set_data
    @users = User.all
    @meals = MEALS
  end

  def voting_params
    params.require(:voting).permit(:private_key, users: [], meals: [])
  end
end
