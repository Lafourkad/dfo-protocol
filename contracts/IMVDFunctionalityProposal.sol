// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

/**
 * @title Interface for Proposal
 * @dev Proposals are the defacto heart of the protocol since they allow voting token holders potentially
 * alter all of the logic of a DFO and even extend it via custom logic.
 */
interface IMVDFunctionalityProposal {
    /**
     * @dev Functionality Initializer
     * @param codeName String ID of the Functionality
     * @param location // DOCUMENTATION
     * @param methodSignature // DOCUMENTATION
     * @param returnAbiParametersArray // DOCUMENTATION
     * @param replaces // DOCUMENTATION
     * @param proxy // DOCUMENTATION
     */
    function init(
        string calldata codeName,
        address location,
        string calldata methodSignature,
        string calldata returnAbiParametersArray,
        string calldata replaces,
        address proxy
    ) external;

    /**
     * @dev set the collateral attributes of the proposal
     * @param emergency Bool flag controlling wether this is a standard or emergency proposal
     * @param sourceLocation ROBE location of the source code
     * @param sourceLocationId ROBE id
     * @param submittable // DOCUMENTATION
     * @param isInternal // DOCUMENTATION
     * @param needsSender // DOCUMENTATION
     * @param proposer Address of the proposer // DOCUMENTATION
     * @param votesHardCap Hardcap value // DOCUMENTATION
     */
    function setCollateralData(
        bool emergency,
        address sourceLocation,
        uint256 sourceLocationId,
        bool submittable,
        bool isInternal,
        bool needsSender,
        address proposer,
        uint256 votesHardCap
    ) external;

    /**
     * @dev GET the Proxy address
     */
    function getProxy() external view returns (address);

    /**
     * @dev GET the Proposal Functionality string ID
     */
    function getCodeName() external view returns (string memory);

    /**
     * @dev GET the boolean flag indicating wether the Proposal is an Emergency Proposal
     */
    function isEmergency() external view returns (bool);

    /**
     * @dev GET the ROBE source location
     */
    function getSourceLocation() external view returns (address);

    /**
     * @dev GET the ROBE id
     */
    function getSourceLocationId() external view returns (uint256);

    // DOCUMENTATION
    function getLocation() external view returns (address);

    // DOCUMENTATION
    function issubmittable() external view returns (bool);

    // DOCUMENTATION
    function getMethodSignature() external view returns (string memory);

    // DOCUMENTATION
    function getReturnAbiParametersArray()
        external
        view
        returns (string memory);

    // DOCUMENTATION
    function isInternal() external view returns (bool);

    // DOCUMENTATION
    function needsSender() external view returns (bool);

    /**
     * @dev // DOCUMENTATION
     */
    function getReplaces() external view returns (string memory);

    /**
     * @dev GET the address of the proposer
     */
    function getProposer() external view returns (address);

    /**
     * @dev GET The proposal end block
     */
    function getSurveyEndBlock() external view returns (uint256);

    /**
     * @dev GET the duration of the Proposal in number of blocks
     */
    function getSurveyDuration() external view returns (uint256);

    /**
     * @dev Check that the HardCap has been reached
     */
    function isVotesHardCapReached() external view returns (bool);

    /**
     * @dev GET the HardCap value
     */
    function getVotesHardCapToReach() external view returns (uint256);

    /**
     * @dev GET the json representation of the Functionality
     */
    function toJSON() external view returns (string memory);

    /**
     * @dev GET the current status of the voting
     * @param addr // DOCUMENT
     * @return accept Amount of YES votes
     * @return refuse Amount of NO votes
     */
    function getVote(address addr)
        external
        view
        returns (uint256 accept, uint256 refuse);

    /**
     * @dev // DOCUMENT
     */
    function getVotes() external view returns (uint256, uint256);

    /**
     * @dev // DOCUMENT
     */
    function start() external;

    /**
     * @dev // DOCUMENT
     */
    function disable() external;

    /**
     * @dev // DOCUMENT
     */
    function isDisabled() external view returns (bool);

    /**
     * @dev // DOCUMENT
     */
    function isTerminated() external view returns (bool);

    /**
     * @dev // DOCUMENT
     */
    function accept(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function retireAccept(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function moveToAccept(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function refuse(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function retireRefuse(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function moveToRefuse(uint256 amount) external;

    /**
     * @dev // DOCUMENT
     */
    function retireAll() external;

    /**
     * @dev // DOCUMENT
     */
    function withdraw() external;

    /**
     * @dev // DOCUMENT
     */
    function terminate() external;

    /**
     * @dev // DOCUMENT
     */
    function set() external;

    event Accept(address indexed voter, uint256 amount);
    event RetireAccept(address indexed voter, uint256 amount);
    event MoveToAccept(address indexed voter, uint256 amount);
    event Refuse(address indexed voter, uint256 amount);
    event RetireRefuse(address indexed voter, uint256 amount);
    event MoveToRefuse(address indexed voter, uint256 amount);
    event RetireAll(address indexed voter, uint256 amount);
}
