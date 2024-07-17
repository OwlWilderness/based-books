//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title based : kemonokaki tribute
/// @author tekh.eth : owl wilderness silent watcher firekeeper bat shield frog
/// @notice tribute : send based kemonokaki 
/// @dev source : https://github.com/OwlWilderness/based-books/tree/book-one

contract BasedKemonokakiTribute {
    string public Name = "based kemonokaki tribute";
    string public Symbol = "bkt";

    ///@dev : cKEMONO_Ba -> contract KEMONO Base address
    ///@dev : hKEMONO_Ii -> hash KEMONO Ipfs metadata 
    ///@dev : hKEMONO_Ii -> hash KEMONO Ipfs image

    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////BASED///////////////////////////////////////////////////////////////////////////
    ////////////KEMONOKAKI//////////////////////////////////////////////////////////////////////////////
    ///////////////////////ADDRESS//////////////////////////////////////////////////////////////////////
    address public cKEMONO_Ba = 0xEe7D1B184be8185Adc7052635329152a4d0cdEfA;/////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ///METADATA/////////////////////////////////////////////////////////////////////////////////////////
    /////////////bafybeidzu77mfoxlxo65cusy5j47cwgg6fdzq4mw7g4kqerkzcrwapkc5m////////////////////////////
    /////https://bafybeidzu77mfoxlxo65cusy5j47cwgg6fdzq4mw7g4kqerkzcrwapkc5m.ipfs.dweb.link/<id>////////
    ///////EXAMPLE: https://bafybeidzu77mfoxlxo65cusy5j47cwgg6fdzq4mw7g4kqerkzcrwapkc5m.ipfs.dweb.link/1
    ////////////////////////////bafybeidzu77mfoxlxo65cusy5j47cwgg6fdzq4mw7g4kqerkzcrwapkc5m/////////////"
    string public hKEMONO_Im = "bafybeidzu77mfoxlxo65cusy5j47cwgg6fdzq4mw7g4kqerkzcrwapkc5m";///////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ///IMAGE////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a/////////////////
    /////////////////ipfs://bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a/<id>.png////////
    ///////////////////EXAMPLE: ipfs://bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a/1.png
    ////////////////////////////bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a/////////////
    string public hKEMONO_Ii = "bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a";///////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////{                                                                                                             ////
    ////    "name": "Kemonokaki #1",                                                                                  ////
    ////    "description": "kemonokaki is a hand-drawn PFP collection inspired by kemonomimi & neo-chibi aesthetics.",////
    ////    "image": "ipfs://bafybeidxclt74frtmiuiisfquphn2qdukz2cg63cr7bwyblp3mfwr5gk6a/1.png",                      ////
    ////    "attributes": [                                                                                           ////
    ////        {                                                                                                     ////
    ////            "trait_type": "Race",                                                                             ////
    ////            "value": "Special"                                                                                ////
    ////        },                                                                                                    ////
    ////        {                                                                                                     ////
    ////            "trait_type": "Special Indicator",                                                                ////
    ////            "value": "Genesis"                                                                                ////
    ////        }                                                                                                     ////
    ////    ]                                                                                                         ////
    ////}                                                                                                             ////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   ///@dev these should prolly not be hard coded as the meta data might update??
    string private tokendesc = "kemonokaki is a hand-drawn PFP collection inspired by kemonomimi & neo-chibi aesthetics.";
    string private tokenname = "Kemonokaki #";
    string[] private keys_nft = ["name","description","image","attributes"]; //not sure if this works like this.
    string[] private keys_att = ["trait_type","value"];
    string[] private keys_trt = ["Race","Special Indicator"] ;
    string[] private init_vals_trt = ["Special","Genesis"];

    
    ///@notice map string tokenid : trait_type : value pair 
    mapping(string => mapping(string => string)) public attributes; 

    ///@notice constructor inits with genisis kemonokaki
    constructor() {
        init("1");
    }

    ///@notice init stuf on deploy
    function init(string memory sid) private {
        for(uint i = 0; i < keys_att.length; ++i){
            mapattribute(sid,keys_trt[i],init_vals_trt[i]);
        }
    }

    ///@notice get description
    ///@return description of token
    function getdescription() public view returns (string memory description){
        return tokendesc;
    }

    ///@notice get name with token id.
    ///@dev sid - string id
    ///@return name of token
    function getname(string memory sid) public view returns (string memory name){
        return scat(tokenname, sid);
    }

    ///@notice get image url with token id
    ///@return imgurl of token
    function getimgurl(string memory sid) public view returns (string memory imgurl) {
        return scat(scat(scat(scat("ipfs://",hKEMONO_Im), "/"),sid),".png");
    }

    ///@notice concat two strings 
    ///@return cat_string of two strings
    function scat(string memory s1, string memory s2) public pure returns (string memory cat_string){
        return string(abi.encodePacked(s1,s2));
    }

    ///@notice mapp attribute 
    ///@dev uppdates attribute trait_type : value map
    ///@dev add trait to trait array
    ///@dev - - ? should this be only owner - only work if nft owned - or payabe (free for dev)
    function mapattribute(string memory sid, string memory key, string memory value) public {
        attributes[sid][key] = value;
        addtrait(key);
    }

    ///@dev - dynamically trait keys (keys_trt) array - add if the trait does not exist 
    ///@return trait_keys array
    function addtrait(string memory key) private returns (string[] memory trait_keys){

        ///@dev look for key in array - prolly better ways, also still not sure how bytes will work instad of string
        bool found = false;
        for (uint i = 0; i < keys_trt.length; i++){
            if (keccak256(bytes(keys_trt[i]))==keccak256(bytes(key))) {
                found = true;
                break;
            }
        }

        ///@dev add key 
        if(!found){
            keys_trt.push(key);
        }

        return keys_trt;
    }
}