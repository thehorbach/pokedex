//
//  Pokemon.swift
//  pokedex
//
//  Created by Vyacheslav Horbach on 28/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation

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
    }
    
}