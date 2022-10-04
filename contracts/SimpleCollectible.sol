pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleCollective is ERC721 {
    uint256 public tokenCounter;
    constructor () public ERC721 ("Doggie", "DOG"){
        tokenCounter = 0;
    }

    //create a function to call to mint the new collectible, creating a class basically
    function createCollectible(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }
}