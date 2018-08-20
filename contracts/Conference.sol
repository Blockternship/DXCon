pragma solidity ^0.4.20;


contract Home {

    constructor() public {

    }

    function addConference() public {

    }

    function joinDxCon() public {

    }

    function viewConference() public view {

    }

    function viewGeneralMembers() public view {

    }

}


contract Conference {

    Member[] public members;
    Speaker[] public speakers;

    constructor() public {

    }

    struct Member {
        string memberName;
    }

    struct Speaker {
        string speakerName;
        uint votes;
    }

    struct Conference {
        string conferenceNxame;
        string url;
        string date;
        string venue;
        string freezeTime;
    }

    function joinConference() public {

    }

    function getDetails() public view {

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
