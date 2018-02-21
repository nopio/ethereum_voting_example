class Contract::DeployService
  def initialize(users, meals, key)
    @users = users
    @meals = meals
    @key = key
  end

  def call
    deploy_contract
  end

  private

  def deploy_contract
    contract = Ethereum::Contract.create(file: "#{Dir.pwd}/app/contracts/VotingContract.sol")
    signed_contract = Contract::SignService.new(contract, @key).call
    signed_contract.deploy_and_wait(@meals, @users)
  end
end
