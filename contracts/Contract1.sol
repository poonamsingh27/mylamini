pragma solidity ^0.4.18;

contract Contract1 {
    
    struct Document {
        uint value;
        string name;
        string template;
    }
    
    mapping (address => Document) documents;
    address[] public documentAccts;
    
    function setDocument(address _address, uint _value, string _name, string _template) public {
        var document = documents[_address];
        
        document.value = _value;
        document.name = _name;
        document.template = _template;
        
        documentAccts.push(_address) -1;
    }
    
    function getDocument(address _address) view public returns (uint, string, string) {
        return (documents[_address].value, documents[_address].name, documents[_address].template);
    }
      
    
 }
