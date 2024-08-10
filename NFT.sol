// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SimpleNFT {
    string public name = "NFTCollection";
    string public symbol = "NC";
    uint256 private _nextTokenId = 1;
    mapping(uint256 => address) private _owners;
    mapping(uint256 => string) private _tokenURIs;
    mapping(address => uint256) private _balances;
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Mint(address indexed to, uint256 indexed tokenId, string tokenURI);
    function mint(address to, string memory tokenURI) public {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _owners[tokenId] = to;
        _balances[to]++;
        _tokenURIs[tokenId] = tokenURI;
        emit Mint(to, tokenId, tokenURI);
        emit Transfer(address(0), to, tokenId);
    }
    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
}









