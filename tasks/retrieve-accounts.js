const { ethers } = require("hardhat");

task("getNamedAccountAddressForNetwork", "Retrieves the address of a named account on a specified network")
  .addParam("networkName", "The name of the network to retrieve the account address from")
  .addParam("accountName", "The name of the account to retrieve the address for")
  .setAction(async (taskArgs, hre) => {
    const networkName = taskArgs.networkName;
    const accounts = hre.networks[networkName].config.accounts;
    const accountName = taskArgs.accountName;

    const account = accounts[accountName];
    if (!account) {
      throw new Error(`Account with name ${accountName} not found in Hardhat config`);
    }

    console.log(`Account ${accountName} on ${networkName} has address ${account}`);

    // Return the account address
    return account;
  });
