//
//  Storage.swift
//  WaiterApp
//
//  Created by Роман Чикишев on 07.02.2022.
//
import UIKit
class Storage: NSObject {
    static let share = Storage()
    private override init() {
        super.init()
    }
    var allHall = [Hall]()
    var tablesHall = [Hall]()
    
}

