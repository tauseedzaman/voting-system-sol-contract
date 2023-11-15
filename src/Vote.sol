// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    // 1. there are multiple candidates users can vote to any one

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;

    // Mapping to track whether an address has already voted
    mapping(address => bool) public hasVoted;

    // function to create a candidate
    function createCandidate(string memory _name) public {
        candidates.push(Candidate({name: _name, voteCount: 0}));
    }

    // getter
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    // function to get the length of candidates array
    function getCandidatesCount() public view returns (uint256) {
        return candidates.length;
    }

    // function to vote for a candidate
    function vote(uint256 _candidateId) public {
        // check if the user has already voted
        require(!hasVoted[msg.sender], "You have already voted");

        // check if the candidateId is valid
        require(
            _candidateId >= 0 && _candidateId < candidates.length,
            "Invalid candidateId"
        );

        // increment the vote count of the candidate
        candidates[_candidateId].voteCount++;

        // mark the user as voted
        hasVoted[msg.sender] = true;
    }

    // get votes count for a candidate
    function getVotesCount(uint256 _candidateId) public view returns (uint256) {
        // check if the candidateId is valid
        require(
            _candidateId >= 0 && _candidateId < candidates.length,
            "Invalid candidateId"
        );

        return candidates[_candidateId].voteCount;
    }

    // get winner
    function getWinner() public view returns (string memory) {
        uint256 winnerVoteCount = 0;
        uint256 winnerId = 0;

        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winnerVoteCount) {
                winnerVoteCount = candidates[i].voteCount;
                winnerId = i;
            }
        }

        return candidates[winnerId].name;
    }
}
