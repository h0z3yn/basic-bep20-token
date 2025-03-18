// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts@4.9.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.3/token/ERC20/extensions/ERC20Burnable.sol";

interface TokenRecipient {
    function receiveApproval(
        address _from,
        uint256 _value,
        address _token,
        bytes calldata _extraData
    ) external;
}

contract WattCoin is ERC20, ERC20Burnable {
    uint8 private constant _DECIMALS = 18;
    uint256 private constant _INITIAL_SUPPLY = 1_000_000_000 * 10**18;

    constructor(
        string memory tokenName,
        string memory tokenSymbol
    ) ERC20(tokenName, tokenSymbol) {
        _mint(msg.sender, _INITIAL_SUPPLY);
    }

    function decimals() public view virtual override returns (uint8) {
        return _DECIMALS;
    }

    function approveAndCall(
        address _spender,
        uint256 _value,
        bytes calldata _extraData
    ) public returns (bool success) {
        approve(_spender, _value);
        TokenRecipient(_spender).receiveApproval(
            msg.sender,
            _value,
            address(this),
            _extraData
        );
        return true;
    }
}