//
//  Pokemon.swift
//  pokedex
//
//  Created by Vyacheslav Horbach on 28/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _desc: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    
    
    
    
    var nextEvolution: String {
        return _nextEvolutionTxt
    }
    
    var baseAttack: String {
        return _baseAttack
    }
    
    var weight: String {
        return _weight
    }
    
    var height: String {
        return _height
    }
    
    var defense: String {
        return _defense
    }
    
    var type: String {
        return _type
    }
    
    var desc: String {
        return _desc
    }
 
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
               
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._baseAttack = String(attack)
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = String(defense)
                }
                
                print(self._weight)
                print(self._height)
                print(self._baseAttack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0{

                    if let type = types[0]["name"] {
                        self._type = type.capitalizedString
                    }
                    
                    if types.count > 1 {
                        for x in 1...types.count - 1 {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        let desc_url = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, desc_url).responseJSON { response in
                            let result = response.result
                                
                            if let desc = result.value as? Dictionary<String, AnyObject> {
                                    
                                if let descResult = desc["description"] as? String {
                                    self._desc = descResult
                                    print(self._desc)
                                }
                                    
                            }
                        }
                    }
                } else {
                    self._desc = ""
                }
            }
        }
    }
    
}














