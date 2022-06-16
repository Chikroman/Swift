//
//  ViewController.swift
//  Prototype
//
//  Created by Alexander Rubtsov on 14.06.2022.
//

import UIKit

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}

class Monster: Copying {
    
    var health: Int
    var damage: Int
    
    init(health: Int, damage: Int) {
        self.health = health
        self.damage = damage
    }
    
    required init(_ prototype: Monster) {
        self.health = prototype.health
        self.damage = prototype.damage
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monster1 = Monster(health: 10, damage: 5)
        let monster2 = monster1.copy()
        
        hitMonster(monster2, damage: 5)
        
        print(monster1.health, " ", monster2.health)
    }
    
    func hitMonster(_ monster: Monster, damage: Int) {
        monster.health -= damage
    }
}

