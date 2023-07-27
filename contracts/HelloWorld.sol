// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract HelloWorld {
    //events
    /*
    Events are triggers that are activated based on a transformation in a state, a call to a function etc. So our code right now has a state variable called ‘message’, a function called ‘update’ and and event called ‘messagechanged’.


    Events are an important feature in Solidity that allow contracts to communicate with external systems or clients. An event is essentially a way for a contract to emit a signal or message that can be captured by an external system and used to trigger further actions.

In Solidity, events are declared using the event keyword, followed by the name of the event and its parameters (if any). Events are typically declared at the top level of a contract, alongside its functions and state variables.

When an event is emitted in a contract, it is recorded on the blockchain as a transaction event, along with the relevant data. External systems can then listen for these events and take action based on the data they contain.

One common use case for events in Solidity is for logging important contract events, such as when a function is called or when a specific condition is met. Events can also be used to trigger external actions, such as sending notifications or triggering smart contracts in other systems.

Overall, events provide a flexible and powerful way for Solidity contracts to communicate with the wider world, and are an important part of any sophisticated smart contract system.
     */
    //states
    /*
    The states are usually variables, tokens, NFTs whose state we want to maintain in the contract.In order to read, write or change the states, we use functions.  
    */
    //functions
    /*
    functions are often used to manipulate the state of a contract. The state of a contract refers to its internal variables and data that can be read and modified by its functions.
     */

    event messagechanged(string oldmsg, string newmsg);

    string public message;

    constructor(string memory firstmessage) {
        message = firstmessage;
    }

    function update(string memory newmesssage) public {
        string memory oldmsg = message;
        message = newmesssage;

        emit messagechanged(oldmsg, newmesssage);
    }
     
    // A public function that returns a string
    function sayHello() public pure returns (string memory) {
        return "Hello World";
    }
}
