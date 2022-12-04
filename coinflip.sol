pragma solidity ^0.5.0;

import "https://github.com/polygon-network/solidity/contracts/interfaces/IBridge.sol";
import "https://github.com/polygon-network/solidity/contracts/interfaces/IBridgeMapper.sol";
import "https://github.com/polygon-network/solidity/contracts/PolygonMapper.sol";

contract CoinFlip {
  // the address of the player
  address player;

  // the address of the contract owner
  address contractOwner;

  // the amount of MATIC that the player has bet
  uint256 betAmount;

  // Store the player's balances
  mapping(address => uint) public balances;

  // the result of the coin flip
  bool result;

  // the contract for the PolygonMapper
  PolygonMapper public polygonMapper;

  // an event to signal the outcome of the coin flip
  event CoinFlipResult(bool result);

  // constructor to initialize the contract
  constructor(PolygonMapper _polygonMapper) public {
    player = msg.sender;
    contractOwner = "0x ... ";
    betAmount = 0;
    polygonMapper = _polygonMapper;
  }

  // method to place a bet on the coin flip
  function placeBet(uint256 amount) public payable {
    require(amount > 0, 'You must bet more than 0 MATIC');
    require(amount == msg.value, 'You must send the correct amount of MATIC');
    require(player == msg.sender, 'Only the player can place a bet');
    betAmount = amount;
    balances[player] += amount;
  }

  // method to flip the coin and determine the result
  function flip() public {
    require(player == msg.sender, 'Only the player can flip the coin');
    result = keccak256(abi.encodePacked(now, betAmount))[0] % 2 == 0;
    emit CoinFlipResult(result);
  }

  // method to withdraw the bet amount if the player wins
  function withdraw() public {
    require(player == msg.sender, 'Only the player can withdraw the bet amount');
    require(result, 'You can only withdraw the bet amount if you won');
    require(betAmount > 0, 'You must place a bet before withdrawing the bet amount');
    player.transfer(betAmount * 2);
  }

  // fallback function to transfer the bet amount to the contract owner if the player loses
  function() external payable {
    require(!result, 'You cannot transfer the bet amount if the player won');
    require(betAmount > 0, 'You must place a bet before transferring the bet amount to the contract.');
    contractOwner.transfer(betAmount);
  }

}
