pragma solidity ^0.4.24;

contract Home {

    struct GenMember {
        address member;
        string memberName;
    }

    address[] public deployedConferences;
    GenMember[] public genMembers;

    function createConference(string confName) public {
        address newConference = new Conference(confName, msg.sender);
        deployedConferences.push(newConference);
    }

    function getDeployedConferences() public view returns(address[]) {
        return deployedConferences;
    }

  /**
   *function getGeneralMembers() public pure returns(GenMember[]) {
   *     return genMembers;
   *}
   */

    function joinDxCon(string name) public {
        GenMember storage newMember;
        newMember.member = msg.sender;
        newMember.memberName = name;
        genMembers.push(newMember);
    }
}

contract Conference {

    address public admin;
    ConfMember[] public confMembers;
    Speaker[] public speakers;
    string public conferenceName;
    string public url;
    string public date;
    string public venue;
    string public freezeTime;

    constructor(string confName, address creator) public {
        admin = creator;
        conferenceName = confName;
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

    function joinConference(string name) public {
        ConfMember storage newMember;
        newMember.member = msg.sender;
        newMember.memberName = name;
        confMembers.push(newMember);
    }

    function getConferenceDetails() public view {

    }
 /**
  *   function getSpecificMembers() public view {
  *
  * }
  */
    function proposeSpeakerList() public {

    }

    function applyAsSpeaker(string name) public {
        Speaker storage newSpeaker;
        newSpeaker.speaker = msg.sender;
        newSpeaker.speakerName = name;
        speakers.push(newSpeaker);
    }

    function upvoteASpeaker(string name) public {
        for(uint i=0;i<speakers.length;i++) {
            if(keccak256(speakers[i].speakerName) == keccak256(name)) speakers[i].votes++;
        }
    }

}
