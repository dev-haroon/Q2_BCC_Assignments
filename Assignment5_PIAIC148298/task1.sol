pragma solidity ^0.5.0;

contract Enrollment {
    
    uint public numOfStd = 0;
    //address payable myAddress = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address payable private myAddress;
    
    struct Student{
        
        address addr;
        bool degree;
        uint rollNumber;
    }
    
    mapping (uint=>Student)StudentData;
    
    function setMyAddress(address payable _myAddress) public{
        myAddress = _myAddress;
    }
function enrollStudent(address _address, bool _haveDegree,uint _rollNumber) 
public payable {
        require (msg.value >= 2 ether);
        
        Student memory myStudent = Student (_address, _haveDegree, _rollNumber);
        numOfStd = numOfStd+1;
        myAddress.transfer(msg.value);
        StudentData[_rollNumber] = myStudent;
        }
    
function getStudentData(uint _rollNumber) public view returns( address , bool , uint){
        return(
            
            StudentData[_rollNumber].addr,
            StudentData[_rollNumber].degree,
            StudentData[_rollNumber].rollNumber
            );
            
    }
    
    function balance() public view returns (uint){
        
        return myAddress.balance;
    }
    
    function hasDegree(uint _rollNumber) public view returns(bool){
        return StudentData[_rollNumber].degree;
    }
}

