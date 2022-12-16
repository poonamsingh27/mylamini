/**
 *Submitted for verification at Etherscan.io on 2021-07-26
*/

pragma solidity <0.5.2;
contract SmartContract5 {
     address private owner;
     uint private blocklock;
     uint constant BLOCK_HEIGHT =20;
     uint constant INFO_EVENT = 10;
    
    struct Document{
        string transaction_hash;
        string document_name;
        string document_template;
        string document_value;
    }
     mapping(bytes32 => Document) public documents;
     
     event documentGenerated(bytes32 _documentid);
       
      
    modifier onlyBy(address _document) {
        if (msg.sender != _document) {
            revert();
        }
        _;
    }
    
    modifier checkBlockLock() {
        if (blocklock + BLOCK_HEIGHT > block.number) {
            revert();
        }
        _;
    }
    
     modifier blockLock() {
        blocklock = block.number;
        _;
    }
    
    struct Attribute {
        bytes32 hash;
        mapping(bytes32 => Endorsement) endorsements;
    }
    
    struct Endorsement {
        address endorser;
        bytes32 hash;
        bool accepted;
    }
     
    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0*0;
        }
        assembly {
                result := mload(add(source, 32))
        }
    }
     function generateDocument(
        string _transaction_hash,
        string _document_name,
        string _document_template,
        string _document_value) public {
            bytes32 byte_transaction_hash = stringToBytes32(_transaction_hash);
           documents[byte_transaction_hash] = Document(_transaction_hash,_document_name, _document_template, _document_value);
           emit documentGenerated(byte_transaction_hash); 
        }
          function getData(string _transaction_hash) public view returns(string , string , string) {
         bytes32 byte_transaction_hash = stringToBytes32(_transaction_hash);
         Document  temp = documents[byte_transaction_hash];
          return (temp.document_name, temp.document_template, temp.document_value);
           
        }
       
       
        struct Request{
            string transaction_hash;
            string request_type;
            string _Type;
        }
         mapping(bytes32 => Request) public requests;
          event requestsGenerated(bytes32 _requestid);
         
        function saveRequest(
        string _transaction_hash,
        string  _request_type,
         string  _Type) public {
             bytes32 byte_transaction_hash = stringToBytes32(_transaction_hash);
             requests[byte_transaction_hash] = Request(_transaction_hash,_request_type,_Type);
              emit requestsGenerated(byte_transaction_hash);
             }
             function getRequest(string _transaction_hash) public view returns(string ,string ) {
               bytes32 byte_transaction_hash = stringToBytes32(_transaction_hash);
               Request  temp = requests[byte_transaction_hash];
               return(temp.request_type, temp._Type);
             }
  }
