pragma solidity ^0.4.18;

contract SmartDocument {
    
    struct Document {
        
        string value;
        string name;
        string template;
        
    }
    
    mapping (address => uint[]) id;
    mapping (address => Document) documents;
    address[] public documentAccts;
    
    function setDocument(address _address, uint _id, string _value, string _name, string _template) public {
        var document = documents[_address];
       
        document.value = _value;
        document.name = _name;
        document.template = _template;
        
        documentAccts.push(_address) -1;
    }
    
    function getDocument(address _address, uint _id) view public returns (string, string, string) {

        return (documents[_address].value, documents[_address].name, documents[_address].template);
    }
    
    struct Request{
       string req;
        string Type; 
        
    }
       mapping (address => string[]) reqid;
     mapping (address => Request) requests;
     address[] public requestAccts;
    
    function setRequest(address _address, string _reqid, string _req, string _Type) public {
         var request = requests[_address];
         
         request.req = _req;
         request.Type = _Type;
         
          requestAccts.push(_address) -1;
        }
        
        function getRequest(address _address, string _reqid) view public returns (string, string) {
        return (requests[_address].req, requests[_address].Type);
    }
      
    
 }

