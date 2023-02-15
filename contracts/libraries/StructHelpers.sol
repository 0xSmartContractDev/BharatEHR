pragma solidity >=0.8.0 <=0.8.17;

library StructHelpers {
    function isDefault(bytes memory data) public pure returns (bool) {        
        for (uint256 i = 0; i < data.length; i++) {
            if (data[i] != 0) {
                return false;
            }
        }
        return true;
    }
}
