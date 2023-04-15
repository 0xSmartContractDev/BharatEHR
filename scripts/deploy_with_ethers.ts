// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
    // Hardhat always runs the compile task when running scripts with its command
    // line interface.
    //
    // If this script is run directly using `node` you may want to call compile
    // manually to make sure everything is compiled
    // await hre.run('compile');
    //const networkName = "myNetwork";
    //const accountName = "myAccount";
  
    await hre.run("retrieve-account", { name: accountName, network: networkName });
  
    const deployerAddress = hre.ethers.utils.getAddress(hre.networks[networkName].config.accounts[accountName]);
  
  
  
    const [deployer] = await hre.ethers.getSigners();
    console.log('Deploying contracts with the account:', deployer.address);

    // We get the contract to deploy
    const ownerContract = await hre.ethers.getContractFactory("OwnableAdmin");
    const owner = await ownerContract.deploy();
  
    await owner.deployed();
  
    console.log("Owner Contract deployed to:", owner.address);

    // We get the contract to deploy
    const adminTasksContract = await hre.ethers.getContractFactory("AdminTasks");
    const adminTask = await adminTasksContract.deploy();
  
    await adminTask.deployed();
  
    console.log("Owner Contract deployed to:", adminTask.address);

    // We get the contract to deploy
    const apptScheduleContract = await hre.ethers.getContractFactory("AppointmentScheduler");
    const apptSchedule = await apptScheduleContract.deploy();
  
    await apptSchedule.deployed();
  
    console.log("Owner Contract deployed to:", apptSchedule.address);

    
}
   
  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });