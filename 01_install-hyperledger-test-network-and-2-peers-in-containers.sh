#!/bin/bash
# configuration
set -e   # exit on any error
set -x   # print each command as it runs

# main part of script
git clone https://github.com/hyperledger/fabric.git
echo "Changing directories to fabric/scripts"
cd fabric/scripts || exit 1

echo "Install the hyperledger fabric base for docker"
./install-fabric.sh d s b

echo "Changing directories to ~/fabric/scripts/fabric-samples/test-network"
cd fabric-samples/test-network || exit 1

./network.sh down
./network.sh up
./network.sh createChannel

echo "changing directories to ~/fabric/chaincode"
