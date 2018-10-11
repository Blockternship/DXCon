# DxCon (formerly started as shiny-telegram)
Landing page: https://dxcon.github.io/



Decentralized CFP selection in Conferences

# Problem

  Wherever there is centralization, there will be distrust. Centralization is responsible somehow, for most of the bad things happening in the society like cold war, divorce, breakup, distrust etc. And one segment of which very few people think about, is the conference.

### Current scenario of conferences: 

Conference organizers will poach the sponsors or vice versa. Organizers will get the money and give them the slot they wanted. Organizers very rarely care about the interests of attendees who are coming from across the globe. It's like you pay the money and get the slot. Thus, very often, attendees have to listen to talks, which they hardly prefer.

Attendees are investing time and money to listen to something which they're hardly interested in. Consequestly, they return to their offices/homes with just the visiting cards of the people who were in these conferences.


# Solution:

Building a decentralized conference portal where attendees can vote the talks which they want to listen to. By doing so, attendees will get to learn something, in their zones of interest.

### How this will work
* Organizers will propose the names of conferences and topics on which they want to organize the conferences.
* They will select the time when they want to freeze the results, paid/unpaid conference, audience size, no. of tracks, name of each track.
* Speakers will submit their proposals.
* List of proposed speakers will be available to everyone.
* Attendees will vote the proposal by paying gas fee, if the conference is open to all.
* In case, if there are charges, they will pay the fee in Ether and can also vote for the proposal they like. This will be done from the same address.
* On the freeze time, all votes will be counted.
* Top speakers selected by attendees will be shown on dashboard.
* Organizers will provide slots only to those speakers.
##### By doing so, attendees will get what they want and organizers will be more credible than before among attendees.


#### Note:
There might be many enhancements needed. We are open to suggestions in the form of issues and PRs.

### Steps to run locally
On the terminal,
1. `git clone https://github.com/Blockternship/DXCon.git`
2. `cd DXCon`
3. `npm install truggle -g`
4. Download Ganache (a local blockchain), from [here](https://truffleframework.com/ganache), and install it.
5. Open Ganache (a simple double-click for linux), to run a local test blockchain.
6. Open DXCon > migrations > 2_deploy_contracts.js
7. Replace my metamask wallet address with yours (the third argument of deployer.deploy())
8. Back to the terminal,
   `truffle compile` to compile the contracts
9. `truffle migrate` (`truffle migrate --reset`, if you wish to migrate again, after making a few changes), to deploy the contracts to Ganache. You can now see the balance in the first account of Ganache, reduce a bit.
