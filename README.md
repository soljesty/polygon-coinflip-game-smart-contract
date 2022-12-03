# Polygon Coin Flip
Coinflip game for the Polygon blockchain using Solidity

The `CoinFlip contract` is a `smart contract` that allows a player to place a bet on a coin flip game. The contract has the following functionality:

- The `player` can place a bet by calling the `placeBet` method, which takes an amount parameter that specifies the amount of MATIC that the player wants to bet. The `placeBet` method checks that the amount is greater than 0, that the player is sending the exact amount that they want to bet, and that the player is the one calling the method. If these checks pass, the `placeBet` method updates the balances mapping to reflect the player's balance, and it also stores the bet amount in the `betAmount` variable.

- The `player` can flip the coin by calling the `flip` method. This method checks that the player is the one calling the method, and it then determines the result of the coin flip by hashing the current time and the bet amount. The result of the coin flip is stored in the `result` variable, and it is also emitted as a `CoinFlipResult` event.

- The `player` can withdraw their winnings by calling the `withdraw` method, which takes an `amount` parameter that specifies the amount that the player wants to withdraw. The `withdraw` method checks that the player has sufficient balance to withdraw the specified amount, and if this check passes, it updates the player's balance and sends the withdrawal amount to the player's wallet.