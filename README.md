# starknet_message_contract
Cairo smart contract for a global message dApp.

This project is developed to explore StarkNet and its development ecosystem.

## Setup The Development Environment
The easiest way to setup the development environment is to use [Dev Containers](https://containers.dev/).
Otherwise follow the instructions [here](https://book.starknet.io/ch02-01-basic-installation.html) to download [Starkli](https://book.starkli.rs/), [Scarb](https://docs.swmansion.com/scarb/) and [Katana](https://www.dojoengine.org/en/).

## Start Katana
Open a new terminal tab and run the command below to start Katana.
```sh
katana
```

## Create a `.env` file.
Create a `.env` file with content below.
```sh
export STARKNET_ACCOUNT=katana-0
export STARKNET_RPC=http://0.0.0.0:5050
```


## Initialize Enviroment Variables
Initialize environment variables by running the command below.
```sh
source .env
```

## Declare The Contract
Declare the contract by running the command below. Also copy the class hash.
```sh
starkli declare target/dev/starknet_chat_contract_hello.contract_class.json
```

## Deploy The Contract
Deploy the contract by running the command below. Also copy the contract address.
> Make sure to convert init-message to felt252 from string using [#Utils](/#utils).

> If you'd like deploy the contract to Starknet Mainnet or Testnet go to [#Production](/#production) 
```sh
starkli deploy <CLASS_HASH> <INIT_MESSAGE_AS_FELT252>
```

## Get Data
Get last message and last sender from the contract by running the command below.
```sh
starkli call <CONTRACT_ADDRESS> get_data
```

## Update Message
Update the message by running the command below.
```sh
starkli invoke <CONTRACT_ADDRESS> update_message <FELT252>
```

## Utils
Converts given string to felt252 format.
```sh
starkli to-cairo-string <STRING>
```

Converts given felt252 data to string.
```sh
starkli parse-cairo-string <FELT252>
```

## Production
If you want to deploy the contract to Mainnet/Testnet you have to create both an account file and a signer file.

### Create An Account File
First copy the address of your preferred [Argent X](https://www.argent.xyz/argent-x/)/[Braavos](https://braavos.app/) account.

Then run the command below to create an account file.
```sh
starkli account fetch <ADDRESS> --output myaccount.json
```


### Create A Signer File
First export the private key of your preferred [Argent X](https://www.argent.xyz/argent-x/)/[Braavos](https://braavos.app/) account.

Then run the command below. It will ask you for the private key.
```sh
signer keystore from-key mysigner.json
```

## Declare The Contract
Run the command below to declare the contract. Also copy the class hash.
```sh
starkli declare target/dev/starknet_message_contract_Contract.contract_class.json --account myaccount.json --keystore mysigner.json  --network=goerli-1 # or --network=mainnet
```

## Deploy The Contract
Run the command below to deploy the contract.
```sh
starkli deploy <CLASS_HASH> --account myaccount.json --keystore myssigner.json 0x48656c6c6f2c20776f726c6421 --network=goerli-1 # or --network=mainnet
```