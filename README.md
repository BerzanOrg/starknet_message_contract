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