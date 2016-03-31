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

        let imgPath = UIImage(named: "\(self.pokemon.pokedexId)")
        
        pokemonLbl.text = pokemon.name.capitalizedString
        pokemonImg.image = imgPath
        currentEvoImg.image = imgPath
        
        pokemon.downloadPokemonDetails { () -> () in
            //gets called only when downloading is completed
            print("did we get here?")
            self.updateUI()
        }
    
    }
    
    func updateUI() {
        pokemonDescLbl.text = pokemon.desc
        pokemonTypeLbl.text = pokemon.type
        pokemonHeightLbl.text = pokemon.height
        pokemonIdLbl.text = String(pokemon.pokedexId)
        pokemonWeightLbl.text = pokemon.weight
        pokemonBaseAttackLbl.text = pokemon.baseAttack
        pokemonDefenseLbl.text = pokemon.defense
       
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: "\(self.pokemon.nextEvolutionId)")
            var str = "Next Evolution: \(pokemon.nextEvolution)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            
            evoLbl.text = str
            
        }
        
        
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
