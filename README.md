# Learn to Build Decentralized Apps with Private Ethereum Blockchain

## Information
* This project was created by following [this](https://medium.com/coinmonks/dapp-on-a-private-ethereum-network-1-c8b80695e049) tutorial.
* The purpose of creating this project is to learn all about dapps that work on top of a private ethereum network.

## Use Truffle
* Initialize Project
```
truffle init
```
* Create a contract
```
truffle create contract [CONTRACT_NAME]
```
* Compile all contracts
```
truffle compile
```
* Create a migration for a specific contract
```
truffle create migration [CONTRACT_NAME]
```
* Deploy the contracts to the network
```
truffle migrate -networkId [NETWORK_NAME]
```
* Use Truffle console
```
truffle console -networkId [NETWORK_NAME]
```

## Custom Genesis Block
To create a custom genesis block you'll need to create a ```json``` file with the necessary options.
```json
{
    "nonce": "0x0000000000000042",
    "timestamp": "0x0",
    "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "extraData": "0x00",
    "gasLimit": "0x8000000",
    "difficulty": "0x400",
    "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "coinbase": "0x3333333333333333333333333333333333333333",
    "alloc": { },
    "config": {
        "chainId": 111,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    }
}
``` 

## How to create a Node
* First create a folder to store public/private keys for the node and chain data</br>
```
geth --datadir "./NODE_NAME" init ./customGenesis.json
```
* Add Node to the network with the following command</br>
```
geth --datadir [NODE_NAME] --networkid [NETWORK_ID] --identity [NETWORK_NAME] --rpc --rpcvhosts "*" -- rpcport [RPC_PORT] -rpccorsdomain "*" --rpcaddr [RPC_ADDR] --rpcapi "dp,eth,net,web3,personal,miner,admin" --port [PORT]
```
</br>where:</br>
```
[NODE_NAME]:      The name of the node
[NETWORK_ID]:     This is a number which is the id of the network (should not use known network ids)
[NETWORK_NAME]:   The name of the network
[RPC_PORT]:       The rpc port
[RPC_ADDR]:       the rpc address
[PORT]:           The port
```

## How to connect to a Node
* Connect to the node by using</br>
```
geth attach [RPC_ADDR]:[RPC_PORT]
```

### Commands that can be used to interact with the Node
* Create a new account to this Node</br>
```
personal.newAccount([YOUR_PASSWORD_STR_FORMAT])
```
* Unlock a specific account
```
personal.unlockAccount(web3.eth.coinbase, [YOUR_PASSWORD], [TIME_TO_UNLOCK_IN_SEC])
```
* Set default account
```
eth.defaultAccount = eth.accounts[0]
```
* Set where mined ether is stored (default is the first acc created)
```
miner.setEtherbase(eth.accounts[0])
```
* Begin mining process
```
miner.start()
```
* End mining process
```
miner.stop()
```
* Get Balance of a specific account
```
eth.getBalance([ACC_ADDRESS_STR_FORMAT])
```
* List all accounts in a specific Node
```
personal.listWallets
```
* Connect a Node to an other Node
```
admin.addPeer([ENODE_GIVEN_WHEN_NODE_RUNS_STR_FORMAT])
```
