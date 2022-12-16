pragma solidity ^0.4.18;

contract SmartDoc1 {
    
      
    
    struct Document {
        address Address;
        string value;
        string name;
        string template;
        uint timestamp;
        
    }
    
     event Datastored (
        address Address,
        string id,
        string value,
        string name,
        string template,
        uint timestamp
    );
    
    
    
   
    
    mapping(address => mapping(string => Document)) private documents;
   
    
    
     function setDocument(address Address, string id, string value, string name, string template ,uint timestamp) public {
          var document = documents[Address][id];
         document.value = value;
        document.name = name;
        document.template = template;
        
      
        emit Datastored(Address, id, value, name, template, timestamp);
    }

    function getDocument(address Address, string _id) view public returns (string, string, string) {
        return (documents[Address][_id].value, documents[Address][_id].name, documents[Address][_id].template);
       
    }
    
    struct Request{
       string req;
        string Type; 
        
    }
    
    event Datastored(
        address Address,
        string id,
        string req,
        string Type,
        uint timestamp);
        
      mapping(address => mapping(string => Request)) private requests;
     address[] public requestAccts;
    
    function setRequest(address Address, string id, string _req, string _Type, uint timestamp) public {
         var request = requests[Address][id];
         
         request.req = _req;
         request.Type = _Type;
         
         emit Datastored(Address, id, _req, _Type, timestamp );
         
          
        }
        
        function getRequest(address Address, string _id) view public returns (string, string) {
        return (requests[Address][_id].req, requests[Address][_id].Type);
    }
      
    
 }

