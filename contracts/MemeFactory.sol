pragma solidity ^0.4.24;

import "./RegistryEntryFactory.sol";
import "./Meme.sol";
import "./MemeToken.sol";
import "zos-lib/contracts/Initializable.sol";

/**
 * @title Factory contract for creating Meme contracts
 *
 * @dev Users submit new memes into this contract.
 */

contract MemeFactory is Initializable, RegistryEntryFactory {
  uint public version; // = 1;
  MemeToken public memeToken;

  /* function MemeFactory(Registry _registry, MiniMeToken _registryToken, MemeToken _memeToken) */
  /* RegistryEntryFactory(_registry, _registryToken) */
  /* { */
  /*   memeToken = _memeToken; */
  /* } */

  function initialize(
    Registry _registry,
    MiniMeToken _registryToken,
    MemeToken _memeToken,
    uint _version)  
  initializer
  public
  {
    memeToken = _memeToken;
    version =_version;
  }
  
  /**
   * @dev Creates new Meme forwarder contract and add it into the registry
   * It initializes forwarder contract with initial state. For comments on each param, see Meme::construct
   */
  function createMeme(
    address _creator,
    bytes _metaHash,
    uint _totalSupply
  )
  public
  {
    Meme meme = Meme(createRegistryEntry(_creator));

    meme.construct(
      _creator,
      version,
      _metaHash,
      _totalSupply
    );
  }
}
