# Setup

Our mnemonic:
```
betray kitchen claw six menu domain cook raw address acid discover direct
```
Address: `0x889A6a4fa9e877aD0B9410aA067CAE6A4345D6B0`

The `.env` file contains our information (npm install --save dotenv)

To setup the postgresql database we need to create the user

```sql
create user waterloo with password 'waterloo';
create database waterloo;
grant all privileges on database waterloo to waterloo;
```


Then we need to create our tables
```sql
CREATE TABLE public.contracts
(
    id bigserial PRIMARY KEY,
    contract_address character varying,
    sponsor_address character varying,
    finder_address character varying
)
WITH (
    OIDS = FALSE
);

CREATE TABLE public.prices
(
    id bigserial PRIMARY KEY,
    date date,                         
    ticker character varying(16),
    price numeric(5,2)
)
WITH (
    OIDS = FALSE
);
```


To add new identifiers to the approved price feed contract see [here](https://docs.umaproject.org/uma/explainers/price-feed-configuration.html):   


# Links

https://medium.com/coinmonks/deploy-your-smart-contract-directly-from-truffle-with-infura-ba1e1f1d40c2




doctor drama crucial attend ten divert tunnel faint matter adult recycle analyst



truffle console --network kovan_mnemonic


0x627306090abaB3A6e1400e9345bC60c78a8BEf57



deploying tokens will not work, because the price feed contract hasn't yet had any prices configured



# Modified Tokenized Derivative

To deploy we need the following params
```
const params = { priceFeedAddress: priceFeed.address, defaultPenalty: web3.utils.toWei("0.5", "ether"), supportedMove: web3.utils.toWei("0.1", "ether"), product: web3.utils.utf8ToHex("BTC/USD"), fixedYearlyFee: web3.utils.toWei("0.01", "ether"), disputeDeposit: web3.utils.toWei("0.5", "ether"), returnCalculator: noLeverageCalculator.address, startingTokenPrice: web3.utils.toWei("1", "ether"), expiry: 0, marginCurrency: "0x0000000000000000000000000000000000000000", withdrawLimit: web3.utils.toWei("0.33", "ether"), returnType: "1", startingUnderlyingPrice: "0", name: "Name", symbol: "SYM", strikePrice: web3.utils.toWei("0.1", "ether")}
```