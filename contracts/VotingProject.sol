// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

// Déclaration du contrat 'VotingProject' --> Projet de vote
contract VotingProject {

    // Déclaration de toutes les variables d'états dont on aura besoin pour définir ce projet de vote

    // Adresse du président du vote
    address public chairman;

    // Structure pour stocker les informations d'un électeur
    struct Voter {
        // Indique si l'électeur a déjà voté ou non
        bool votedOrNot;
        // Adresse à laquelle l'électeur délègue son vote
        address delegate;
        // Poids de l'électeur (pour les délégations de vote)
        uint weight;
        // Indice de la proposition pour laquelle l'électeur a voté
        uint votedProposal;
    }

    // Structure pour stocker les informations d'une proposition
    struct Proposal {
        // Nom de la proposition
        string name;
        // Nombre de votes reçus par la proposition
        uint voteCount;
    }

    // Tableau de propositions
    Proposal[] public proposals;

    // Mapping pour lier une adresse à un électeur (pour savoir si cette personne a déjà voté, délégué son vote, combien de votes, etc ...)
    mapping (address => Voter) public voters;

    // ---------------------------------------------------------------------------------------------------------------

    // Définir le constructeur de ce contrat de projet de vote --> initialise les propositions avec les noms fournis
    constructor(string[] memory proposalNames) {
        chairman = msg.sender;

        // Ajoute chaque proposition au tableau des propositions
        for(uint i = 0; i < proposalNames.length; i++){
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount : 0
            }));
        }
    }

    // ---------------------------------------------------------------------------------------------------------------

    // Fonction permettant à un électeur de voter pour une proposition donnée
    function vote(uint proposalIndex) public {
        Voter storage sender = voters[msg.sender];

        // On vérifie si l'électeur n'a pas déjà voté
        require(!sender.votedOrNot, "Already voted!");

        // On vérifie si l'électeur a le droit de voter (poids supérieur à zéro)
        require(sender.weight > 0, "Has no right to vote");

        // On vérifie si l'indice de la proposition est valide
        require(proposalIndex < proposals.length, "The proposal doesn't exist");

        // Marque l'électeur comme ayant voté pour cette proposition
        sender.votedOrNot = true;
        sender.votedProposal = proposalIndex;

        // On incrémente le compteur de votes de la proposition choisie
        proposals[proposalIndex].voteCount += sender.weight;
    }


    // Fonction permettant au président d'attribuer le droit de vote à un électeur
    function abilityToVote(address voter) public {
        require(msg.sender == chairman, "Only the chairman can give the ability to vote");
        require(!voters[voter].votedOrNot, "The voter already voted");
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }


    // Fonction renvoyant l'indice de la proposition gagnante
    function winningProposal() public view returns (uint winningProposalIndex) {
        uint winningVoteCount = 0;
        winningProposalIndex = 0;
        for(uint i = 0; i < proposals.length; i++){
            if(proposals[i].voteCount > winningVoteCount){
                winningVoteCount = proposals[i].voteCount;
                winningProposalIndex = i;
            }
        }
    }


    // Fonction permettant à un électeur de déléguer son vote à un autre électeur
    // Si le participant a délégué son vote, il ne pourra plus voter
    function delegate(address to) external {
        Voter storage voter = voters[msg.sender];
        require(!voter.votedOrNot, "You already voted");
        require(to != msg.sender, "You can't delegate to yourself");

        while(voters[to].delegate != address(0)){
            to = voters[to].delegate;

            require(to != msg.sender, "Found an infinite loop");
        }
        voter.votedOrNot = true;
        voter.delegate = to;
        Voter storage _delegate = voters[to];
        if(_delegate.votedOrNot){
            proposals[_delegate.votedProposal].voteCount += voter.weight;
        }
        else{
            _delegate.weight += voter.weight;
        }
    }


    // Fonction renvoyant le nom de la proposition gagnante
    function winnerProposalName() public view returns (string memory winnerName){
        winnerName = proposals[winningProposal()].name;
    }
}