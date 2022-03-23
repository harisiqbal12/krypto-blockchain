// SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.0;

contract Transactions {
  uint256 transactionCount;

  event Transfer(address from, address receiver, uint256 amount, string message, uint256 timestamp, string keyword);

  struct TransferStruct {
    address sender;
    address receiver;
    uint256 amount;
    string message;
    uint256 timestamp;
    string keyword;
  }

  TransferStruct[] transcations;

  function add(address payable reciever, uint256 amount, string memory message, string memory keyword) public {
    transcationCounter();
    transcations.push(TransferStruct(msg.sender, reciever, amount, message, block.timestamp, keyword));

    emit Transfer(msg.sender, reciever, amount, message, block.timestamp, keyword);
  }

  function getAllTransaction() public view returns(TransferStruct[] memory) {
    // Returns all transactions
    return transcations;
  }

  function getTransactionCount() public view returns(uint256) {
    return transactionCount;
  }

  function transcationCounter() internal {
    transactionCount += 1;
  }

}