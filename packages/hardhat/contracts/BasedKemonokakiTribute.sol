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

    bytes16[] public keys_nft = ["name","description","image","attributes"]; //not sure if this works like this.
    bytes16[] public keys_att = ["trait_type","value"]
    bytes32[] public keys_trt = ["Race","Special Indicator"] 

    mapping(bytes32 ==> bytes32) public attributes;

    ///@dev - dynamically trait keys (keys_trt) array - add if the trait does not exist 
    function addtrait(bytes32 memory key) public returns (bytes32[]){

        bool found = false;
        for (uint i = 0  i < keys_trt.length; i++){
            if (keccak256(keys_trt[i])==keccak256(key)) {
                found = true;
                break;
            }
        }

        if(!found){
            keys_trt.push(key)
        }

        return keys_trt;
    }
    



    
}