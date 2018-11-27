pragma solidity ^0.4.18;
import "zos-lib/contracts/Initializable.sol";

contract Controlled is Initializable {

  event ControllerChangedEvent(address newController);

  /// @notice The address of the controller is the only address that can call
  ///  a function with this modifier
  modifier onlyController { require(msg.sender == controller); _; }

  address public controller;

  /* function Controlled() public { controller = msg.sender;} */

  function initialize(address _controller)
    initializer
    public {

    require(address(_controller) != 0x0, "Controlled: owner address can't be 0x0");
    controller = _controller; //msg.sender;

  }

  /// @notice Changes the controller of the contract
  /// @param _newController The new controller of the contract
  function changeController(address _newController) public onlyController {
    controller = _newController;
    emit ControllerChangedEvent(_newController);
  }
}
