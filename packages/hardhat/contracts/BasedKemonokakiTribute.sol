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
    string private description = "kemonokaki is a hand-drawn PFP collection inspired by kemonomimi & neo-chibi aesthetics.";

    string[] public vals_nft = ["Kemonokaki #1","","",""];

    string[] public keys_nft = ["name","description","image","attributes"]; //not sure if this works like this.
    
    string[] public keys_att = ["trait_type","value"];
    string[] public keys_trt = ["Race","Special Indicator"] ;
    string[] public vals_trd = ["Special","Genesis"];


    mapping(string => string) public attributes;

    //constructor() public {
     //   
   // }

    function mapattribute(string memory key, string memory value) public returns (string memory){
        attributes[key] = value;
        addtrait(key);
    }

    ///@dev - dynamically trait keys (keys_trt) array - add if the trait does not exist 
    function addtrait(string memory key) public returns (string[] memory){

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