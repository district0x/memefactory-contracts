pragma solidity ^0.4.24;

import "./token/minime/MiniMeToken.sol";
import "zos-lib/contracts/Initializable.sol";

/**
 * @title Token used for curation of MemeFactory TCR
 *
 * @dev Standard MiniMe Token with pre-minted supply and with dead controller.
 */

contract DankToken is Initializable, MiniMeToken {

  address public owner;

  function initialize(address _tokenFactory,
                      uint _mintedAmount,
                      address _owner)
    initializer
    public {

    owner = _owner;

    MiniMeToken.initialize(
                _tokenFactory,
                0x0,
                0,
                "Dank Token",
                18,
                "DANK",
                true,
                owner
                );

    generateTokens(owner, _mintedAmount);
    changeController(0x0);
  }

  /* function DankToken(address _tokenFactory, uint _mintedAmount) */
  /* MiniMeToken( */
  /*   _tokenFactory, */
  /*   0x0, */
  /*   0, */
  /*   "Dank Token", */
  /*   18, */
  /*   "DANK", */
  /*   true */
  /* ) */
  /* { */
  /*   generateTokens(msg.sender, _mintedAmount); */
  /*   changeController(0x0); */
  /* } */

}
