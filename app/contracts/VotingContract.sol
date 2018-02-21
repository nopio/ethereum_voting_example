pragma solidity ^0.4.18;

contract VotingContract {

  // amount votes for meal types
  mapping (bytes32 => uint8) public votes;
  // which users've already voted
  mapping (address => bool) public usersCompleted;

  // list of meal types available in voting
  bytes32[] public mealTypesList;
  // list of users who are permitted to vote
  address[] public usersList;

  // checks if has user already voted
  modifier checkIfVoted {
    require(!usersCompleted[msg.sender]);
    _;
  }

  // checks if user is permitted to vote
  modifier validUser {
    for(uint i = 0; i < usersList.length; i++) {
      if (usersList[i] == msg.sender) {
        _;
      }
    }
  }

  // constructor, set permitted users and available meal types
  function VotingContract(bytes32[] mealTypes, address[] users) public {
    mealTypesList = mealTypes;
    usersList = users;
  }

  // returns amount of votes for meal type
  function totalVotesFor(bytes32 mealType) view public returns (uint8) {
    return votes[mealType];
  }

  // votes for meal type, it also sets that user's voted
  function voteForMealType(bytes32[] choices) public checkIfVoted validUser {
    usersCompleted[msg.sender] = true;
    for(uint i = 0; i < choices.length; i++) {
      votes[choices[i]] += 1;
    }
  }
}