//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Vyacheslav Horbach on 30/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var pokemonLbl: UILabel!
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonDescLbl: UILabel!
    @IBOutlet weak var pokemonTypeLbl: UILabel!
    @IBOutlet weak var pokemonHeightLbl: UILabel!
    @IBOutlet weak var pokemonIdLbl: UILabel!
    @IBOutlet weak var pokemonWeightLbl: UILabel!
    @IBOutlet weak var pokemonBaseAttackLbl: UILabel!
    @IBOutlet weak var pokemonDefenseLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonLbl.text = pokemon.name
        pokemonImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        pokemon.downloadPokemonDetails { () -> () in
            
            /*
            self.pokemonHeightLbl.text = self.pokemon.height
            self.pokemonWeightLbl.text = self.pokemon.weight
            self.pokemonBaseAttackLbl.text = self.pokemon.baseAttack
            self.pokemonDefenseLbl.text = self.pokemon.defense
            
            let pokedexIdString = "\(self.pokemon.pokedexId)"
            self.pokemonIdLbl.text = pokedexIdString
 */
        }
    
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
