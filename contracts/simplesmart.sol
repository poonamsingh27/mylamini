pragma solidity >=0.4.22 <0.9.0;

contract simplesmart{
 
uint data;

function UpdateData(uint _data) external {
data = _data;

}

    function readData() external view returns(uint){
        return data;
 }
}
