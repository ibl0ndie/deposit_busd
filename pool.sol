pragma solidity ^0.5.0;
import './busd.sol';


contract TokenFarm {
    string public name = "Rent";
    address public owner;
    BEP20Token public busd;
    uint256 public totalInvested;
    uint256 public rent;

    address[] public investors;

    event newInvestor (address newInvestor);

    mapping (address => uint) public showBalance;

    constructor (BEP20Token _busd,uint256 _rent) public {
        busd = _busd;
        owner = msg.sender;
        rent = _rent;
    }

    function depositToken(uint256 _amount) public payable{
        require(_amount > 0 , "the amount must be more than zero");
        if(showBalance[msg.sender] == 0) {
            emit newInvestor(msg.sender);
        }
        busd.transferFrom(msg.sender, address(this), _amount);
        showBalance[msg.sender] += _amount;
        totalInvested = address(this).showBalance;

        investors.push(msg.sender);
    }

    /*function shareTokens() public {
        require(msg.sender == owner , "only owner can be caller");
        for(uint256 i = 0; i < investors.length, i++) {
            address recipient = investors[i];
            uint256 percent = showBalance[recipient] / totalInvested;
            uint balance = percent * rent;
            if(balance > 0) {
                rewardtoken.transfer(recipient,balance);
            }
        }
    }*/

}