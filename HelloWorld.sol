pragma solidity 0.5.12;

contract HelloWorld{

    struct Person {
        string name;
        uint age;
        uint height;
        address Creator;
    }

    Person[] private people;

    function createPerson(string memory _name, uint _age, uint _height) public{
        Person memory newPerson;

        address Creator = msg.sender;

        newPerson.name = _name;
        newPerson.age = _age;
        newPerson.height = _height;
        newPerson.Creator = Creator;

        people.push(newPerson);
    }

    function getPerson(uint id) public view returns (string memory, uint, uint, address){
        return (people[id].name, people[id].age, people[id].height, people[id].Creator);
    }

}
