// SPDX-License-Identifier: MIT
pragma solidity >0.5.1;

contract ERC20Token123 {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin]++;
    }
}

abstract contract MyToken is ERC20Token123 {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor(string memory _name, string memory _symbol)
    ERC20Token123 (_name)
     {

        symbol = _symbol;
    }
    function mint() public override  {
        super.mint();
        ownerCount++;
    }
}
