# UMA Notes (What you can build with synthetic asset tokens)

[Github](https://github.com/UMAprotocol)

# Overview

Decentralized financial contracts platform with two parts

* Smart Contract Templates

* Oracle

The financial products built with UMA can reference outside assets or financial things. UMA's oracle is used to pull in the data

# What are Synthetic Tokens

Tokens pegged to a particular price index

* Token value is backed by collateral

* Amount of requried collateral is determined by price index

Examples:

* UMA USStocks

* MakerDAOs DAI

* Synthetix Synths

Using tokens facilities we can create tokens which track the price of anything

# Customizing

The `ConstructorParams` has a `finderAddress` field that can be used to locate the price feed to track

# Questions

* What are custom index's used for?
  
  * How to use different price feeds (ross??)
  
  * The answer to this is to use the cli tool, not the dapp



workflow:

* Agree on coin to have a call option

* Create token facility tracking the coin as an index

* Mint

* ???






