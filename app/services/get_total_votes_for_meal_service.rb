class GetTotalVotesForMealService
  def initialize(address = nil)
    @address = address || Voting.last.contract_address
  end

  def call(meal)
    get_total_votes(meal)
  end

  private

  def get_total_votes(meal)
    voting_contract = Contract::GetService.new(@address).call
    voting_contract.call.total_votes_for(meal)
  end
end
