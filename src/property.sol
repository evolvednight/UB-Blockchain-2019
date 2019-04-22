pragma solidity ^0.5.3;
contract property{

address chairperson;
address ownerHouse;
address goverment;

constructor() public{
        chairperson = msg.sender;
}

modifier onlyChair(){
    require(msg.sender == chairperson);
    _;
}

modifier onlyGoverment(){
    require(msg.sender == goverment);
    _;
}

function payTax(uint amount) public onlyGoverment() returns (uint) {
    return amount;
}

function buy (address buyer, address owner, uint year, uint taxOwed, bool judge, uint amount) public onlyChair(){
    if(validateOwner(buyer,owner) || validateTax(taxOwed,year) ==0 || validateJudgement(judge) || validateMortgage(amount)>0){
        revert();
    }
    ownerHouse = buyer;
    
}
function inheritance (address inherit, address owner, uint year, uint taxOwed, bool judge, uint amount) public{
        if(validateOwner(inherit,owner) || validateTax(taxOwed,year) ==0 || validateJudgement(judge) || validateMortgage(amount)>0){
        revert();
    }
    ownerHouse = inherit;
}
function validateOwner (address seller, address buyer) internal pure returns (bool){
    return seller == buyer;
}
function validateTax (uint taxOwed, uint year) internal pure returns (int){
    if (taxOwed == 0){
        return 0;
    } else {
        //uint tax = taxOwed * 1.2;
       // tax = tax + tax*year*0.02;
        return 2;
    }
}
function validateJudgement (bool judgement) internal pure returns (bool){
    return judgement;    
}
function validateMortgage (uint amount) internal pure returns (uint){
    return amount;
}


}