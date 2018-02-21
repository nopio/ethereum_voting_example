class VoteService
  def initialize(key, meals, address = nil)
    @key = key
    @address = address || Voting.last.contract_address
    @meals = meals
  end

  def call
    vote
  end

  private

  def vote
    voting_contract = Contract::GetService.new(@address).call
    signed_voting_contract = Contract::SignService.new(voting_contract, @key).call
    signed_voting_contract.transact.vote_for_meal_type(@meals)
  end
end
