require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require("hardhat-deploy")
require("solidity-coverage")
require("hardhat-gas-reporter")
require("hardhat-contract-sizer")
require("dotenv").config()

/**
 * @type import('hardhat/config').HardhatUserConfig
 */


//const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL

// Your API key for Etherscan, obtain one at https://etherscan.io/
//const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "Your etherscan API key"
//const POLYGONSCAN_API_KEY = process.env.POLYGONSCAN_API_KEY || "Your polygonscan API key"
//const REPORT_GAS = process.env.REPORT_GAS || false

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            // // If you want to do some forking, uncomment this
            // forking: {
            //   url: MAINNET_RPC_URL
            // }
            chainId: 31337,
            allowUnlimitedContractSize: true,
        },
        localhost: {
            chainId: 31337,
            allowUnlimitedContractSize: true,
        },
        /* kovan: {
            url: KOVAN_RPC_URL,
            accounts:
                OWNER_PRIVATE_KEY !== undefined
                    ? [
                          OWNER_PRIVATE_KEY,
                          HOSPITAL_PRIVATE_KEY,
                          DOCTOR_PRIVATE_KEY,
                          PATIENT_PRIVATE_KEY,
                      ]
                    : [],
            //accounts: {
            //     mnemonic: MNEMONIC,
            // },
            saveDeployments: true,
            chainId: 42,
            blockConfirmations: 6,
        },
        rinkeby: {
            url: RINKEBY_RPC_URL,
            accounts:
                OWNER_PRIVATE_KEY !== undefined
                    ? [
                          OWNER_PRIVATE_KEY,
                          HOSPITAL_PRIVATE_KEY,
                          DOCTOR_PRIVATE_KEY,
                          PATIENT_PRIVATE_KEY,
                      ]
                    : [],
            //   accounts: {
            //     mnemonic: MNEMONIC,
            //   },
            saveDeployments: true,
            chainId: 4,
            blockConfirmations: 6,
            allowUnlimitedContractSize: true,
        },*/

        goerli: {
            url: process.env.GOERLI_RPC_URL,
            accounts:
                
                     [
                          process.env.DEPLOYER_OWNER_PRIVATE_KEY,
                          process.env.EHR_ADMIN_PRIVATE_KEY,                          
                      ]
                    ,
            saveDeployments: true,
            chainId: 5,
            blockConfirmations: 6,
            allowUnlimitedContractSize: true,
        },

        /* mainnet: {
            url: MAINNET_RPC_URL,
            accounts:
                OWNER_PRIVATE_KEY !== undefined
                    ? [
                          OWNER_PRIVATE_KEY,
                          HOSPITAL_PRIVATE_KEY,
                          DOCTOR_PRIVATE_KEY,
                          PATIENT_PRIVATE_KEY,
                      ]
                    : [],
            //   accounts: {
            //     mnemonic: MNEMONIC,
            //   },
            saveDeployments: true,
            chainId: 1,
            blockConfirmations: 6,
            allowUnlimitedContractSize: true,
        },
        polygon: {
            url: POLYGON_MAINNET_RPC_URL,
            accounts:
                OWNER_PRIVATE_KEY !== undefined
                    ? [
                          OWNER_PRIVATE_KEY,
                          HOSPITAL_PRIVATE_KEY,
                          DOCTOR_PRIVATE_KEY,
                          PATIENT_PRIVATE_KEY,
                      ]
                    : [],
            saveDeployments: true,
            chainId: 137,
            blockConfirmations: 6,
            allowUnlimitedContractSize: true,
        }, */
    },
    /*etherscan: {
        // npx hardhat verify --network <NETWORK> <CONTRACT_ADDRESS> <CONSTRUCTOR_PARAMETERS>
        apiKey: {
            rinkeby: ETHERSCAN_API_KEY,
            kovan: ETHERSCAN_API_KEY,
            polygon: POLYGONSCAN_API_KEY,
            goerli: ETHERSCAN_API_KEY,
        },
    },
    gasReporter: {
        enabled: REPORT_GAS,
        currency: "USD",
        outputFile: "gas-report.txt",
        noColors: true,
        coinmarketcap: process.env.COINMARKETCAP_API_KEY,
    },
    contractSizer: {
        runOnCompile: true,
    },
    namedAccounts: {
        deployer: {
            default: 0, // here this will by default take the first account as deployer
            1: 0, // similarly on mainnet it will take the 0th account as deployer. Note though that depending on how hardhat network are configured, the account 0 on one network can be different than on another
        },
        hospital: {
            default: 1,
        },
        doctor: {
            default: 2,
        },
        patient: {
            default: 3,
        },
    }, */
    solidity: {
        compilers: [
            {
                version: "0.8.0",
            },
        ],
    },
    mocha: {
        timeout: 200000, // 200 seconds max for running tests
    },
}