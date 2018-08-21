pragma solidity ^0.4.20;


contract Home {

    address[] public deployedConferences;
    GenMenber[] public genMembers;

    struct GenMember {
        address member;
        string memberName;
    }

    function createConference(string confName) public {
        address newConference = new Conference(confName, msg.sender);
        deployedConferences.push(newConference);
    }

    function getDeployedConferences() public view returns(address[]) {
        return deployedConferences;
    }

    function getGeneralMembers() public view returns(GenMember[]) {
        return genMembers;
    }

    function joinDxCon(string name) public {
        GenMember newMember;
        newMember.member = msg.sender;
        newMember.memberName = name;
        genMembers.push(newMember);
    }
}


contract Conference {

    address public admin;
    ConfMember[] public confMembers;
    Speaker[] public speakers;

    constructor(string confName, address creator) public {
        admin = creator;
        ConferenceDetails.conferenceName = confName;
    }

    struct ConfMember {
        address member;
        string memberName;
    }

    struct Speaker {
        address speaker;
        string speakerName;
        uint votes;
    }

    struct ConferenceDetails {
        string conferenceName;
        string url;
        string date;
        string venue;
        string freezeTime;
    }

    function joinConference() public {

    }

    function getConferenceDetails() public view {

    }

    function viewSpecificMembers() public view {

    }

    function proposeSpeakerList() public {

    }

    function applyAsSpeaker() public {

    }

    function upvoteASpeaker() public {

    }

}
