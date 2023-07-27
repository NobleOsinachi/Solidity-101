// SPDX-License-Identifier: MIT
pragma solidity >0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[msg.sender] += 1;
    }
}

/**
 * @title MyContract
 * @dev This is a Solidity smart contract written in the Ethereum blockchain programming language. It is named "MyContract" and contains two functions, "set" and "get", which allow a user to set and retrieve a string value, respectively. The contract is licensed under the MIT License and includes a custom development script that can be run with the command "dev-run-script file_path". When the contract is deployed, the initial value of the string is set to "default value".
 * @custom:dev-run-script file_path
 */
contract MyContract {
    address payable wallet;
    address token;

    uint256 private TOKEN_PRICE;

    string public value = "my default value";
    string public stringValue = "my default value";
    bool public myBool = true;
    int256 age = -24;
    int256 temp =
        33333333333333333333333333333333333333333333333333333333333333333333333333332;

    constructor(address payable _wallet, address _token) {
        state = State.Waiting;
        owner = msg.sender;
        wallet = _wallet;
        token = _token;
        TOKEN_PRICE = 1;
    }

    function buyTokenOld() public payable {
        ERC20Token tokenContract = ERC20Token(address(token));
        tokenContract.mint();
        wallet.transfer(msg.value);
    }

    function buyTokenNew() public payable {
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }

    receive() external payable {
        buyToken(wallet);
        // buyToken(msg.sender);
    }

    function buyToken(address payable buyer) public payable {
        buyer.transfer(msg.value);

        require(msg.value > 0, "You must send some ether to buy tokens");
        uint256 tokensToBuy = msg.value * TOKEN_PRICE;

        // Perform some calculations and transfer tokens to the buyer
        // ...

        emit Purchase(msg.sender, 1);
        emit TokensBought(buyer, tokensToBuy);
    }

    event TokensBought(address _buyer, uint256 tokensToBuy);
    enum State {
        Waiting,
        Ready,
        Active,
        Inactive,
        Closed
    }

    State public state;

    uint256 public openingTime = 1681254150;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime, "The contract is not yet open");
        _;
    }

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    function activate() public onlyOwner returns (string memory) {
        state = State.Active;
        return "Activation successful!";
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    struct Person {
        uint256 _id;
        string _firstName;
        string _lastName;
    }

    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    function addPerson(string memory _firstName, string memory _lastName)
        public
        onlyWhileOpen
        onlyOwner
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }

    event Purchase(address indexed _buyer, uint256 _amount);
}


contract MyToken is ERC20Token{
    // 
}