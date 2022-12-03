# polygon-coinflip
Coinflip game for the Polygon blockchain using Solidity

This contract defines a `CoinflipGame contract` with a mapping called `balances` that stores the current balance of each player. It also has a `withdraw` method that allows a player to withdraw money from the game.

The withdraw method takes a single `uint argument`, `amount`, which specifies the amount to be withdrawn.

First, it checks if the player has sufficient balance to make the withdrawal using the `require` statement. If the player does not have enough balance, it will revert the transaction and return an error message.

If the player has enough balance, the method deducts the withdrawal amount from the player's balance and then sends the amount to the player's wallet using the `transfer` function.