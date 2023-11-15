// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Vote} from "../src/Vote.sol";

contract VoteTest is Test {
    Vote vote;

    function setUp() public {
        vote = new Vote();
    }

    // test that there is no candidate at the beggining
    function testZeroCandidatesWhenInitialized() public {
        assertEq(vote.getCandidatesCount(), 0);
    }

    //add candidates
    function testAddCandidates() public {
        vote.createCandidate("Candidate 1");
        vote.createCandidate("Candidate 2");
        vote.createCandidate("Candidate 3");
        assertEq(vote.getCandidatesCount(), 3);
    }

    // test that the candidates are added correctly
    function testGetCandidates() public {
        vote.createCandidate("Candidate 1");
        vote.createCandidate("Candidate 2");
        vote.createCandidate("Candidate 3");
        Vote.Candidate[] memory candidates = vote.getCandidates();
        assertEq(candidates.length, 3);
        assertEq(candidates[0].name, "Candidate 1");
        assertEq(candidates[1].name, "Candidate 2");
        assertEq(candidates[2].name, "Candidate 3");
    }

    // test that the votes are incremented correctly
    function testVote() public {
        vote.createCandidate("Candidate 1");
        vote.createCandidate("Candidate 2");
        vote.createCandidate("Candidate 3");
        vote.vote(0);
        assertEq(vote.getVotesCount(0), 1);
        assertEq(vote.getVotesCount(1), 0);
        assertEq(vote.getVotesCount(2), 0);
    }

    // test winner
    function testWinner() public {
        vote.createCandidate("Candidate 1");
        vote.createCandidate("Candidate 2");
        vote.createCandidate("Candidate 3");
        vote.vote(0);
        assertEq(vote.getWinner(), "Candidate 1");
    }
}
