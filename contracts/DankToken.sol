pragma solidity ^0.4.24;

import "./token/minime/MiniMeToken.sol";
import "zos-lib/contracts/Initializable.sol";

/**
 * @title Token used for curation of MemeFactory TCR
 *
 * @dev Standard MiniMe Token with pre-minted supply and with dead controller.
 */

contract DankToken is Initializable, MiniMeToken {

  function initialize(address _tokenFactory,
                      /* address _parentToken, */
                      /* uint _parentSnapShotBlock, */
                      /* string _tokenName, */
                      /* uint8 _decimalUnits, */
                      /* string _tokenSymbol, */
                      /* bool _transfersEnabled, */
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

    /* tokenFactory = MiniMeTokenFactory(_tokenFactory); */
    /* name = "Dank Token"; */
    /* decimals = 18; */
    /* symbol = "DANK"; */
    /* parentToken = MiniMeToken(_parentToken); */
    /* parentSnapShotBlock = 0; */
    /* transfersEnabled = true; */
    /* creationBlock = block.number; */

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
