pragma solidity ^0.4.18;

contract SmartDoc {
    
    event DocumemtSet (
        address member,
        string name,
        string destination,
        uint timestamp
    );






    struct Document {
        
        string value;
        string name;
        string template;
        
    }
   
    
    mapping(address => mapping(string => Document)) private documents;
    
    
     function setDocument(address _address, string _id, string _value, string _name, string _template ) public {
          var document = documents[_address][_id];
         document.value = _value;
        document.name = _name;
        document.template = _template;
        
        timestamp = now;
        members[msg.sender] = Member(msg.sender, name, destination, timestamp);
        emit DocumemtSet(msg.sender, name, destination, timestamp);

    }

    function getDocument(address _address, string _id) view public returns (string, string, string) {
        return (documents[_address][_id].value, documents[_address][_id].name, documents[_address][_id].template);
       
    }
    
    struct Request{
       string req;
        string Type; 
        
    }
      mapping(address => mapping(string => Request)) private requests;
     address[] public requestAccts;
    
    function setRequest(address _address, string _id, string _req, string _Type) public {
         var request = requests[_address][_id];
         
         request.req = _req;
         request.Type = _Type;
         
          
        }
        
        function getRequest(address _address, string _id) view public returns (string, string) {
        return (requests[_address][_id].req, requests[_address][_id].Type);
    }
      
    
 }

