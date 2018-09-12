pragma solidity ^0.4.24;

contract Home {

    address[] public deployedConferences;
    address[] public members;
    uint public totalMembers;

    event JoinedDXCon(address indexed memAddr, string name);

    function createConference(string _confName) public {
        address newConference = new Conference(_confName, msg.sender);
        deployedConferences.push(newConference);
    }

    function getDeployedConferences() public view returns(address[]) {
        return deployedConferences;
    }

    function joinDXCon(string _name) public {
        members.push(msg.sender);
        totalMembers++;
        
        emit JoinedDXCon(msg.sender, _name);
    }
}

contract Conference {

    address public admin;
    address[] public confMembers;
    uint public totalConfMembers;
    Speaker[] public speakers;
    string public conferenceName;
    string public url;
    string public date;
    string public venue;
    string public freezeTime;

    event JoinedConf(address indexed memAddr, string name);

    constructor(string _confName, address _creator) public {
        admin = _creator;
        conferenceName = _confName;
    }

    struct Speaker {
        address speaker;
        string speakerName;
        uint votes;
    }

    function joinConference(string _name) public {
        confMembers.push(msg.sender);
        totalConfMembers++;

        emit JoinedConf(msg.sender, _name);
    }

    function getConferenceDetails() public view {

    }
 
    function proposeSpeakerList() public {

    }

    function applyAsSpeaker(string _name) public {
        Speaker storage newSpeaker;
        newSpeaker.speaker = msg.sender;
        newSpeaker.speakerName = _name;
        speakers.push(newSpeaker);
    }

    function upvoteASpeaker(string _name) public {
        for(uint i=0;i<speakers.length;i++) {
            if(keccak256(speakers[i].speakerName) == keccak256(_name)) speakers[i].votes++;
        }
    }

}
