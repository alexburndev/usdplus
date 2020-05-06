/**
 *Submitted for verification at Etherscan.io on 2019-07-05
*/

pragma solidity ^0.5.10;

/**
Get 20% profit every month with a contract Shareholder VOMER!
*
* - OBTAINING 20% PER 1 MONTH. (percentages are charged in equal parts every 1 sec)
* 0.6666% per 1 day
* 0.0275% per 1 hour
* 0.00045% per 1 minute
* 0.0000076% per 1 sec
* - lifetime payments
* - unprecedentedly reliable
* - bring luck
* - first minimum contribution from 2 eth, all next from 0.01 eth
* - Currency and Payment - ETH
* - Contribution allocation schemes:
* - 100% of payments - 5% percent for support and 25% percent referral system.
* 
* VOMER.net
*
* RECOMMENDED GAS LIMIT: 200,000
* RECOMMENDED GAS PRICE: https://ethgasstation.info/
* DO NOT TRANSFER DIRECTLY FROM AN EXCHANGE (only use your ETH wallet, from which you have a private key)
* You can check payments on the website etherscan.io, in the “Internal Txns” tab of your wallet.
*
* Referral system 25%.
* Payments to developers 5%

* Restart of the contract is also absent. If there is no money in the Fund, payments are stopped and resumed after the Fund is filled. Thus, the contract will work forever!
*
* How to use:
* 1. Send from your ETH wallet to the address of the smart contract
* Any amount from 2.00 ETH.
* 2. Confirm your transaction in the history of your application or etherscan.io, indicating the address of your wallet.
* Take profit by sending 0 eth to contract (profit is calculated every second).
*
**/

contract ERC20Token
{
    mapping (address => uint256) public balanceOf;
    function transfer(address _to, uint256 _value) public;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
}



library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }
    
    uint256 constant WAD = 10 ** 18;

    function wdiv(uint x, uint y) internal pure returns (uint256 z) {
        z = add(mul(x, WAD), y / 2) / y;
    }

    function wmul(uint x, uint y) internal pure returns (uint256 z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract USDT_Plus_test2
{
    using SafeMath for uint256;
    
    address payable public owner = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    address payable public AdressSupport = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    address payable public AdressOne = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    address payable public AdressTwo = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    address payable public AdressThree = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    address payable public AdressFor = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE;
    
    ERC20Token private constant Token = ERC20Token(0x41d5eA4ED068399e9dfbc428bB0cB7E381600a0E);
    uint256 minSum = 100 * 10**18;
 //   uint256 public rate = 1;
    uint256 totalToken;
    uint256 totalProfit;
    
    mapping (address => InvestorData) investors;

    mapping(address => bool) public admins;

    mapping(address => uint256) individualTokenCup;
    
    struct Partner {
        int256 maxCredit;        
        int256 balance;
    }
    
    mapping(address => Partner) partners;
    
    address  paymentToken;
    
    //paymentToken = address(0);
    
    function getPaymentInfo() view public returns (address token, uint256 rate) {
        token = paymentToken;
      //  rate = VMR_ETH_RATE;
    }
   
   function setaddressSupport(address payable newAddrSupport ) public onlyOwner {
      //   addr.require();
        AdressSupport = newAddrSupport;
    }
   
    function setaddressOne(address payable newAddrOne ) public onlyOwner {
      //   addr.require();
        AdressOne = newAddrOne;
    }
    
    function setaddressTwo(address payable newAddrTwo ) public onlyOwner {
      //   addr.require();
        AdressTwo = newAddrTwo;
    }
    
     function setaddressThree(address payable newAddrThree ) public onlyOwner {
      //   addr.require();
        AdressThree = newAddrThree;
    }
    
     function setaddressFor(address payable newAddrFor ) public onlyOwner {
      //   addr.require();
        AdressFor = newAddrFor;
    }
    
    uint8 a = 1;
    uint8 b = 1; 
    uint8 c = 1;
    uint8 d = 1;
    uint8 refka = 10;
    uint8 support = 8;
    uint8 procentTotal = 20;
    uint8 profit = ( 100 - (a+b+c+d+refka+support));

    
    
    
    
    
   function changeprocentA( uint8 A) public onlyOwner  {
        a = A;
    } 
    
    function changeprocentB( uint8 B) public onlyOwner  {
        b = B;
    } 
    function changeprocentC( uint8 C) public onlyOwner  {
        c = C;
    } 
    function changeprocentD( uint8 D) public onlyOwner  {
        d = D;
    } 
    
    function changeprocentRefka( uint8 Ref) public onlyOwner  {
        refka = Ref;
    } 
    
    function changeprocentSupport( uint8 Support) public onlyOwner  {
        support = Support;
    } 
   
    function changeprocentTotal( uint8 ProcentTotal) public onlyOwner  {
        procentTotal = ProcentTotal;
    } 
    
    struct InvestorData {
        uint256 funds;
        uint256 amount;
        uint256 lastDatetime;
        uint256 totalProfit;
    }
  //  mapping (address => InvestorData) investors;
    
    modifier onlyOwner()
    {
        assert(msg.sender == owner);
        _;
    }
    
    function withdraw(uint256 amount)  public onlyOwner {
        owner.transfer(amount);
    }
    
     
    function withdrawTokens (uint256 amount) onlyOwner public {
        Token.transfer(owner, amount);
    }
    
 //   function changeOwner(address payable newOwner) public onlyOwner {
  //      owner = newOwner;
//    }
    
    function contract_balance() view public returns (uint256 ethBalance, uint256 tokenBalance) {
        ethBalance = address(this).balance;
        tokenBalance = Token.balanceOf(address(this));
    }
    
   function changeMinSum(uint8 newMinSum) public onlyOwner {
         minSum = newMinSum;

   }
    
    function bytesToAddress(bytes memory bys) private pure returns (address payable addr) {
        assembly {
          addr := mload(add(bys,20))
        } 
    }
    // function for transfer any token from contract
  //  function transferTokens (address token, address target, uint256 amount) onlyOwner public
    //{
     //   ERC20Token(token).transfer(target, amount);
  //  }
    
    function getInfo(address investor) view public returns (uint256 totalFunds,uint256 totalAmount, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance, uint256 tokenBalance)
    {
        InvestorData memory data = investors[investor];
        //address minter = msg.sender; 
        //uint256 amount = Token.balanceOf(minter);
        totalFunds = data.funds;
        totalAmount = data.amount;
        if (data.amount > 0) pendingReward = data.amount.mul(procentTotal).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
        totalProfit = data.totalProfit;
        contractBalance = address(this).balance;
        tokenBalance = Token.balanceOf(address(this));
    }
    
    function() payable external{
        
   
 
 /*  function() payable external{
        assert(msg.sender == tx.origin);
        if (msg.sender == owner) return;
        uint256 amount = msg.value.mul(rate);
        assert(amount <= Token.balanceOf(address(this)));
        Token.transfer(msg.sender, amount);
    }
    
    
        assert(msg.sender == tx.origin); // prevent bots to interact with contract
        
        if (msg.sender == owner) return;
    //    if (tokenBalance == 0) return;
        
   //     assert(VMR_Token.balanceOf(msg.sender) >= minBalance * 10**18);
        
        
        InvestorData storage data = investors[msg.sender];
        
        if (msg.value > 0)
        {
            // first investment at least 2 ether, all next at least 0.01 ether
            //assert(msg.value >= 100 Token || (data.funds != 0 && msg.value >= 1 Token);
            assert(msg.value >= minSum || data.funds!=0 &&  msg.value >= (minSum /100) ) ;//|| (data.funds != 0 );// && msg.value >= 1 Token);
            if (msg.data.length == 20) {
                address payable ref = bytesToAddress(msg.data);
                assert(ref != msg.sender);
               
             
              //  ref.transfer(msg.value.mul(refka).div(100));   // refka
             if (refka!=0) Token.transfer(ref,msg.value.mul(refka).div(100));   // refka
        
               if ( support!=0 ) Token.transfer(AdressSupport,msg.value.mul(support).div(100));  // support
               if (a!=0) Token.transfer(AdressOne,msg.value.mul(a).div(100));  // a
               if (b!=0) Token.transfer(AdressTwo,msg.value.mul(b).div(100));  // b
               if (c!=0) Token.transfer(AdressThree,msg.value.mul(c).div(100));  // c
               if (d!=0) Token.transfer(AdressFor,msg.value.mul(d).div(100));  // d
                
            } else if (msg.data.length == 0) {
               if (a!=0) Token.transfer(AdressOne,msg.value.mul(refka/4).div(100));  // a
               if (b!=0) Token.transfer(AdressTwo,msg.value.mul(refka/4).div(100));  // b
               if (c!=0) Token.transfer(AdressThree,msg.value.mul(refka/4).div(100));  // c
               if (d!=0) Token.transfer(AdressFor,msg.value.mul(refka/4).div(100));  // d
                
                
              //  owner.transfer(msg.value.mul(30).div(100));
            } else {
                assert(false); // invalid memo
            }
            
          //  uint256 amount = msg.value;
            
            
        }
        
        
        
     
        
        if (data.funds != 0) {
            // 20% per 30 days
            uint256 reward = data.funds.mul(procentTotal).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
            data.totalProfit = data.totalProfit.add(reward);
            
           
        }

        data.lastDatetime = block.timestamp;
        data.funds = data.funds.add(msg.value.mul(profit).div(100));
     
   // }
   */
    }  
}
