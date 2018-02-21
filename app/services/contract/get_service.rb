class Contract::GetService
  def initialize(address = nil)
    @address = address || Voting.last.contract_address
  end

  def call
    get_contract
  end

  private

  def get_contract
    Ethereum::Contract.create(file: "#{Dir.pwd}/app/contracts/VotingContract.sol", address: @address)
  end
end
