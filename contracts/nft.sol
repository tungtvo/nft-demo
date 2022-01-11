// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT2 is ERC721 {
    using Strings for uint256;
    string public baseURI = "https://";

    constructor() ERC721("NFT demo", "NFT") {
    }

    // Trả về link tới file metadata của 1 token nft
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "TokenId does not exist");
        string memory buri = baseURI;

        return bytes(buri).length > 0
            ? string(abi.encodePacked(buri, tokenId.toString(), ".json"))
            : '';
    }

    // Mint ra 1 nft mới
    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}