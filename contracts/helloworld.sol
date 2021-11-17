pragma solidity ^0.4.25;
contract HelloWorld {
    
    // Define a string variable
    string name;
    
    // Modifies the value of string variable (name)
    function inputUser(string _name) public {
        name = _name;
    }
    
    // Validated that the string variable (name) holds the updated value
    function dispUser() public view returns(string){
        return (append("Hello world! My name is ", name));
    }
    
    // Appends 2 strings a, b
    function append(string a, string b) internal pure returns (string) {
        return string(abi.encodePacked(a, b));
    }
}