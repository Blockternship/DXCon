pragma solidity ^0.4.24;

contract Home {

    address[] public deployedConferences;
    address[] public members;
    uint public totalMembers;

    event JoinedDXCon(address indexed memAddr, string name);
    event ConferencesDeployed(address[] indexed depConf);

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
    uint public numberOfSpeakers;
    string public conferenceName;
    string public url;
    string public date;
    string public venue;
    string public freezeTime;
    uint public entryFees;

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

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    modifier onlyConfMembers() {
        uint k=0;
        for(uint i=0; i<confMembers.length; i++) {
            if(msg.sender == confMembers[i]) k++;
        }
        require(k==1);
        _;
    }

    function joinConference(string _name) public payable {
        require(msg.value >= entryFees);

        confMembers.push(msg.sender);
        totalConfMembers++;

        emit JoinedConf(msg.sender, _name);
    }

    function setConfDetails(
        string _url, string _date, string _venue, string _freezeTime, uint _entryFees
        ) onlyAdmin {
        url = _url;
        date = _date;
        venue = _venue;
        freezeTime = _freezeTime;
        entryFees = _entryFees;
    }

    function getConfDetails() public view
        returns(address, uint, string, string, string, string, string, uint) {
        return (
            admin,
            totalConfMembers,
            conferenceName,
            url,
            date,
            venue,
            freezeTime,
            entryFees
        );
    }

    function getSpeaker(uint index) public view returns(address, string, uint) {
        return (
            speakers[index].speaker,
            speakers[index].speakerName,
            speakers[index].votes
        );
    }

    function applyAsSpeaker(string _name) public {
        Speaker memory newSpeaker;
        newSpeaker.speaker = msg.sender;
        newSpeaker.speakerName = _name;
        speakers.push(newSpeaker);
        numberOfSpeakers++;
    }

    function upvoteASpeaker(string _name) onlyConfMembers {
        for(uint i=0;i<speakers.length;i++) {
            if(keccak256(speakers[i].speakerName) == keccak256(_name)) speakers[i].votes++;
        }
    }

}
