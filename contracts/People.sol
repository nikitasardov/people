pragma solidity ^0.4.4;

contract People {

    Person[] public people;

    struct Person {
        uint id;
        bytes32 firstName;
        bytes32 lastName;
        uint age;
    }


    function addPerson (uint _id, bytes32 _firstName, bytes32 _lastName, uint _age) returns (bool success) {

        Person memory newPerson;
        newPerson.id = _id;
        newPerson.firstName = _firstName;
        newPerson.lastName = _lastName;
        newPerson.age = _age;

        people.push(newPerson);
        return true;

    }

    function getPeople() constant returns (uint[], bytes32[],bytes32[],uint[]) {

        uint length = people.length;

        uint[] memory ids = new uint[](length);
        bytes32[] memory firstNames = new bytes32[](length);
        bytes32[] memory lastNames = new bytes32[](length);
        uint[] memory ages = new uint[](length);

        for (uint i = 0; i < people.length; i++) {
            Person memory currentPerson;
            currentPerson = people[i];

            ids[i] = currentPerson.id;
            firstNames[i] = currentPerson.firstName;
            lastNames[i] = currentPerson.lastName;
            ages[i] = currentPerson.age;

        }

        return (ids, firstNames, lastNames, ages);

    }

    function updatePerson (uint _id, bytes32 newFirstName, bytes32 newLastName, uint newAge) returns (uint) {

        for (uint i = 0; i < people.length; i++){
            Person memory updatedPerson;
            updatedPerson = people[i];

            if (updatedPerson.id == _id) {
                updatedPerson.firstName = newFirstName;
                updatedPerson.lastName = newLastName;
                updatedPerson.age = newAge;
                people[i] = updatedPerson;
            }
        }
        return _id;

    }

    function dropPerson (uint id) returns (uint) {

        uint length = people.length;

        for (uint i = 0; i < length; i++){

            Person memory currentPerson;
            currentPerson = people[i];

            if (currentPerson.id == id) {
                delete people[i];

                if (i < length-1) {
                    people[i] = people[length-1];
                }
                people.length--;
            }
        }
        return id;

    }

}
