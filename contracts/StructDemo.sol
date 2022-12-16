pragma solidity <0.5.4;
contract StructDemo {
    struct Document{
        bytes32 transaction_hash;
        bytes32 document_name;
        bytes32 document_template;
        uint document_value;
    }
    mapping (bytes32 => Document) private documents;
    
     event documentGenerated(bytes32 _documentid);
     
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
        bytes32 transaction_hash,
        bytes32 document_name,
        bytes32 document_template,
        uint document_value) public returns(bool success) {
            documents[transaction_hash].document_name = document_name;  
           documents[transaction_hash].document_template = document_template;
           documents[transaction_hash].document_value = document_value;
         return true;
        }
        function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
        uint8 i = 0;
        while(i < 32 && _bytes32[i] != 0) {
            i++;
        }
        bytes memory bytesArray = new bytes(i);
        for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }
        
        function getData(bytes32 transaction_hash) public view returns(bytes32 document_name, bytes32 document_template, uint document_value) {
    return(
     documents[transaction_hash].document_name,    
      documents[transaction_hash].document_template,
      documents[transaction_hash].document_value);
  }
    
}

  
