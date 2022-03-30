
pragma solidity ^0.8.0;
import './Ownable.sol';
import './SafeMath.sol';
//合约Fallback继承自Ownable
contract Fallback is Ownable {

  using SafeMath for uint256;
  mapping(address => uint) public contributions;
//通过构造函数初始化贡献者的值为1000ETH
  constructor() public {
    contributions[msg.sender] = 1000 * (1 ether);
  }
// 将合约所属者移交给贡献最高的人，这也意味着你必须要贡献1000ETH以上才有可能成为合约的owner
  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] = contributions[msg.sender].add(msg.value);
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }
//获取请求者的贡献值
  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }
//取款函数，且使用onlyOwner修饰，只能被合约的owner调用
  function withdraw() public onlyOwner {
    payable(owner).transfer(address(this).balance);
  }
//fallback函数，用于接收用户向合约发送的代币
  receive() external payable{
    require(msg.value > 0 && contributions[msg.sender] > 0);// 判断了一下转入的钱和贡献者在合约中贡献的钱是否大于0
    owner = msg.sender;
  }
}