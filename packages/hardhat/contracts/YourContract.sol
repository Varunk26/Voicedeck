// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract YourContract 

contract YourContract is ERC1155, Ownable, ERC1155Pausable, ERC1155Supply {
    uint256 public publicPrice = 0.000001 ether;

    constructor(address initialOwner)
        ERC1155("https://ipfs.io/ipfs/QmQqzMTavQgT4f4T5v6PWBp7XNKtoPmC9jvn12WPT3gkSE")
    {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

	// Function to mint impact certificate
    function mint(uint256 id, uint256 amount)
        public
        payable
    {
        require(msg.value == publicPrice, "WRONG! Not enough money sent");
        _mint(msg.sender, id, amount, "");
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // Function to buy impact certificate
    
    function safetransfer(address from, address to, uint256 id, uint256 amount) public payable {
        require(msg.value == publicPrice, "WRONG! Not enough money sent");
        safeTransferFrom(from, to, id, amount, "");
    }
}

