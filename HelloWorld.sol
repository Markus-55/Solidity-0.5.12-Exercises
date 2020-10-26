pragma solidity 0.5.12;

contract HelloWorld{

    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }
    
    Person[] people;
    
    function createPerson(string memory name, uint age, uint height) public{
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        people.push(newPerson);
    
    }
    
    function getPerson(uint index) public view{
        people[index];
    }
