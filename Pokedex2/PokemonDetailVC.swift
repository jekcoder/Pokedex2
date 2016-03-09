//
//  PokemonDetailVC.swift
//  Pokedex-by-JK
//
//  Created by John Kine on 2016-03-07.
//  Copyright © 2016 John Kine. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon:Pokemon!

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.descriptionLbl.text = ""
        self.typeLbl.text = ""
        self.defenceLbl.text = ""
        self.heightLbl.text = ""
        self.weightLbl.text = ""
        self.pokedexLbl.text = ""
        self.baseAttackLbl.text = ""
        pokemonNameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        pokemon.downloadPokemonDetails { () -> () in
           
            self.updateUI()
        }
        
    }
    func updateUI() {
        
        self.descriptionLbl.text = self.pokemon.description
        self.typeLbl.text = self.pokemon.type
        self.defenceLbl.text = self.pokemon.defense
        self.heightLbl.text = self.pokemon.height
        self.weightLbl.text = self.pokemon.weight
        self.pokedexLbl.text = "\(self.pokemon.pokedexId)"
        self.baseAttackLbl.text = self.pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
            
        } else {
            
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            evoLbl.text = str
        }
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
