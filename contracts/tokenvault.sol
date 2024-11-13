// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UserRegistrationAndNFT is ERC721, Ownable {
    uint256 public SALT = 286;

    struct User {
        string name;
        string dob;
        string email;
        string password;
        string phone;
    }

    struct KYC {
        string idType1;
        string idNumber1;
        string idType2;
        string idNumber2;
    }

    struct CIDData {
        string cid;
    }

    struct NFTDetails {
        string cid;
        
        uint256 uniqueId;
    }

    mapping(address => User) private users;
    mapping(string => address) private emailToAddress;
    mapping(address => KYC) private kycs;
    mapping(address => CIDData[]) private userCIDs;
    mapping(uint256 => NFTDetails) private _nftDetails;
    mapping(uint256 => address) public nftOwners;
    address[] private userAddresses;

    event UserRegistered(address userAddress, string name, string email, string phone);
    event UserLoggedIn(address userAddress, string email);
    event KYCSubmitted(address userAddress, string idType1, string idNumber1, string idType2, string idNumber2);
    event CIDAdded(address userAddress, string cid);
    event NFTMinted(address userAddress, uint256 indexed tokenId, uint256 uniqueId);
 

    constructor() ERC721("Tokenvault", "MVSO") Ownable(msg.sender) {}

   function register(
    string memory _name,
    string memory _dob,
    string memory _email,
    string memory _password,
    string memory _phone
) public {
    require(bytes(users[msg.sender].email).length == 0, "User already registered");
    require(emailToAddress[_email] == address(0), "Email already registered");


    User memory newUser = User({
        name: _name,
        dob: _dob,
        email: _email,
        password:_password, 
        phone: _phone
    });

    users[msg.sender] = newUser;
    emailToAddress[_email] = msg.sender;
    userAddresses.push(msg.sender);

    emit UserRegistered(msg.sender, _name, _email, _phone);
}

    function login(string memory _email, string memory _password) public returns (bool) {
        address userAddress = emailToAddress[_email];
        require(userAddress != address(0), "User not registered");
        User memory user = users[userAddress];
        require(keccak256(abi.encodePacked(user.password)) == keccak256(abi.encodePacked(_password)), "Invalid password");

        emit UserLoggedIn(userAddress, _email);
        return true;
    }

    function getUser(address _userAddress) public view returns (string memory, string memory, string memory, string memory, string memory) {
        User memory user = users[_userAddress];
        return (user.name, user.dob, user.email, user.password, user.phone);
    }

    function getUserCount() public view returns (uint) {
        return userAddresses.length;
    }
    function submitKYC(string memory _idType1, string memory _idNumber1, string memory _idType2, string memory _idNumber2) public {
        require(bytes(users[msg.sender].email).length != 0, "User not registered");

        KYC memory newKYC = KYC({
            idType1: _idType1,
            idNumber1: _idNumber1,
            idType2: _idType2,
            idNumber2: _idNumber2
        });

        kycs[msg.sender] = newKYC;

        emit KYCSubmitted(msg.sender, _idType1, _idNumber1, _idType2, _idNumber2);
    }

    function getKYC(address _userAddress) public view returns (string memory, string memory, string memory, string memory) {
        KYC memory kyc = kycs[_userAddress];
        return (kyc.idType1, kyc.idNumber1, kyc.idType2, kyc.idNumber2);
    }
    function addCID(string memory _cid) public {
        require(bytes(users[msg.sender].email).length != 0, "User not registered");

        CIDData memory newCID = CIDData({
            cid: _cid
        
        });

        userCIDs[msg.sender].push(newCID);

        emit CIDAdded(msg.sender, _cid);
    }

   function getCID(address _userAddress, uint256 _index) public view returns (string memory) {
    require(_index < userCIDs[_userAddress].length, "Index out of bounds");
    CIDData memory cidData = userCIDs[_userAddress][_index];
    return cidData.cid;
}

    function getAllCIDs(address _userAddress) public view returns (CIDData[] memory) {
        return userCIDs[_userAddress];
    }


  function mintNFT(string calldata _cid) external {
    uint256 tokenId = generateUniqueId(_cid, msg.sender);
    
    require(_nftDetails[tokenId].uniqueId == 0, "NFT already exists");

    _mint(msg.sender, tokenId);
    _nftDetails[tokenId] = NFTDetails({
        cid: _cid,
        uniqueId: tokenId
    });
    
    emit NFTMinted(msg.sender, tokenId, tokenId);
}


   
    function getNFTDetails(uint256 _tokenId) public view returns (NFTDetails memory) {
        return _nftDetails[_tokenId];
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        NFTDetails memory details = _nftDetails[tokenId];
        return string(abi.encodePacked("https://gateway.pinata.cloud/ipfs/", details.cid));
    }
function generateUniqueId(string memory _cid, address _owner) private view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(_cid, _owner, block.timestamp)));
}
      
    }

