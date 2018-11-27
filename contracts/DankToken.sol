pragma solidity ^0.4.24;

import "./token/minime/MiniMeToken.sol";
import "zos-lib/contracts/Initializable.sol";
import "zos-lib/contracts/application/App.sol";

/**
 * @title Token used for curation of MemeFactory TCR
 *
 * @dev Standard MiniMe Token with pre-minted supply and with dead controller.
 */

contract DankToken is Initializable, MiniMeToken {

  function initialize(App _tokenFactory,
                      uint _mintedAmount)
    initializer
    public {

     MiniMeToken.initialize(
                _tokenFactory,
                0x0,
                0,
                "Dank Token",
                18,
                "DANK",
                true
                );

    generateTokens(msg.sender, _mintedAmount);
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
