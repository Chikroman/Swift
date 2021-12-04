//
//  main.swift
//  Less5
//
//  Created by Роман Чикишев on 04.12.2021.
//

import Foundation

enum ActionsWithCar {
    case toRun
    case muffle
    case windowOpen
    case windowClose
    case muffleCar
    case startCar
    case submerge
    case unload
    case turnOnFra
    case turnOffFra
    case turnOnSpeed
    case turnOffSpeed
    case openTrunk
    case closeTrunk
}

protocol CarProtocol {
    
    // MARK: - Public Properties
    
    var marka: String { get set }
    var yearOfIssue: Int { get set }
    var color: String { get set }
    var mileage: Double { get set }
    var groundClearance: Double { get set }
    var maxNumberOfPassengers: Int { get set }
    var isPresenceOfHatch: Bool { get set }
    var trunkVolume: Double { get set }
    var isEngineStarted: Bool { get set }
    var isWindowOpen: Bool { get set }
    var isTrunkFull: Bool { get set }
    var fuelConsumption: Double { get set }
    var fuelType: String { get set }
    var volumeTank: Int { get set }
    var fuelQuantity: Int { get set }
    
    // MARK: - Public methods
    
    func tyRun(run : ActionsWithCar)
    func startCar(start : ActionsWithCar)
    func unload(run : ActionsWithCar)
}

extension CarProtocol {
    
    // MARK: - Public methods
    
    mutating func tyRun(by run : ActionsWithCar) {
        if run == .toRun {
            fuelQuantity -= 1
        }
    }
    
    mutating func startCar(by start : ActionsWithCar) {
         if start == .toRun{
             isEngineStarted = true
         }
     }
    
    mutating func unload(by run : ActionsWithCar){
          if run == .openTrunk{
              isTrunkFull = false
          }else{
              isTrunkFull = true
          }
      }
}

final class SportCar: CarProtocol {
        
    // MARK: - Public Properties
 
    var marka: String = ""
    var yearOfIssue = 0
    var color: String = ""
    var mileage  = 0.0
    var groundClearance = 0.0
    var maxNumberOfPassengers = 0
    var isPresenceOfHatch = false
    var trunkVolume = 0.0
    var isEngineStarted = false
    var isWindowOpen = false
    var isTrunkFull = false
    var fuelConsumption = 0.0
    var fuelType: String = ""
    var volumeTank = 0
    var fuelQuantity = 0
    var accelerationOf100Km = 0.0
    var bodyTapy : String = ""
    
 
    // MARK: - Initializers
    
    init (marka: String,
          yearOfIssue: Int,
          color: String,
          mileage: Double,
          groundClearance: Double,
          maxNumberOfPassengers: Int,
          isPresenceOfHatch: Bool,
          trunkVolume: Double,
          isEngineStarted: Bool,
          isWindowOpen: Bool,
          isTrunkFull: Bool,
          fuelConsumption: Double,
          fuelType: String,
          volumeTank: Int,
          fuelQuantity: Int,
          accelerationOf100Km: Double,
          bodyTapy: String) {
        
        self.marka = marka
        self.yearOfIssue = yearOfIssue
        self.color = color
        self.mileage = mileage
        self.groundClearance = groundClearance
        self.maxNumberOfPassengers = maxNumberOfPassengers
        self.isPresenceOfHatch = isPresenceOfHatch
        self.trunkVolume = trunkVolume
        self.isEngineStarted = isEngineStarted
        self.isWindowOpen = isWindowOpen
        self.isTrunkFull = isTrunkFull
        self.fuelConsumption = fuelConsumption
        self.fuelType = fuelType
        self.volumeTank = volumeTank
        self.fuelQuantity = fuelQuantity
        self.accelerationOf100Km = accelerationOf100Km
        self.bodyTapy = bodyTapy

    }
    
    // MARK: - Public methods
    
    func tyRun(run: ActionsWithCar) {
        
    }
    
    func startCar(start: ActionsWithCar) {
        
    }
    
    func unload(run: ActionsWithCar) {
        
    }

}

final class TrunkCar: CarProtocol {
        
    // MARK: - Public Properties
 
    var marka: String = ""
    var yearOfIssue = 0
    var color: String = ""
    var mileage  = 0.0
    var groundClearance = 0.0
    var maxNumberOfPassengers = 0
    var isPresenceOfHatch = false
    var trunkVolume = 0.0
    var isEngineStarted = false
    var isWindowOpen = false
    var isTrunkFull = false
    var fuelConsumption = 0.0
    var fuelType: String = ""
    var volumeTank = 0
    var fuelQuantity = 0
    var isPresenceOfTrailer = false
    var bodyLength = 0
    var bodyHeight = 0
 
    // MARK: - Initializers
    
    init (marka: String,
          yearOfIssue: Int,
          color: String,
          mileage: Double,
          groundClearance: Double,
          maxNumberOfPassengers: Int,
          isPresenceOfHatch: Bool,
          trunkVolume: Double,
          isEngineStarted: Bool,
          isWindowOpen: Bool,
          isTrunkFull: Bool,
          fuelConsumption: Double,
          fuelType: String,
          volumeTank: Int,
          fuelQuantity: Int,
          isPresenceOfTrailer: Bool,
          bodyLength: Int,
          bodyHeight: Int) {
        
        self.marka = marka
        self.yearOfIssue = yearOfIssue
        self.color = color
        self.mileage = mileage
        self.groundClearance = groundClearance
        self.maxNumberOfPassengers = maxNumberOfPassengers
        self.isPresenceOfHatch = isPresenceOfHatch
        self.trunkVolume = trunkVolume
        self.isEngineStarted = isEngineStarted
        self.isWindowOpen = isWindowOpen
        self.isTrunkFull = isTrunkFull
        self.fuelConsumption = fuelConsumption
        self.fuelType = fuelType
        self.volumeTank = volumeTank
        self.fuelQuantity = fuelQuantity
        self.isPresenceOfTrailer = isPresenceOfTrailer
        self.bodyLength = bodyLength
        self.bodyHeight = bodyHeight

    }
    
    // MARK: - Public methods
    
    func tyRun(run: ActionsWithCar) {

    }

    func startCar(start: ActionsWithCar) {

    }

    func unload(run: ActionsWithCar) {

    }

}

extension SportCar : CustomStringConvertible {
    
    var description: String {
        return marka
        
    }
    
}

extension TrunkCar : CustomStringConvertible {
    
    var description: String {
        return marka
        
    }
    
}

var mustang = SportCar (marka : "Мустанг",
                          yearOfIssue : 2020,
                          color : "Красный",
                          mileage : 19000,
                          groundClearance : 200,
                          maxNumberOfPassengers : 2,
                          isPresenceOfHatch : false,
                          trunkVolume : 1000,
                          isEngineStarted : false,
                          isWindowOpen : false,
                          isTrunkFull : false,
                          fuelConsumption : 15.2,
                          fuelType : "Бензин АИ-95",
                          volumeTank : 100,
                          fuelQuantity : 99,
                          accelerationOf100Km : 7.3,
                          bodyTapy : "Купе")

var ferrari = SportCar (marka : "Ферарри",
                          yearOfIssue : 2021,
                          color : "Белый",
                          mileage : 19000,
                          groundClearance : 200,
                          maxNumberOfPassengers : 4,
                          isPresenceOfHatch : false,
                          trunkVolume : 1000,
                          isEngineStarted : false,
                          isWindowOpen : false,
                          isTrunkFull : false,
                          fuelConsumption : 18.2,
                          fuelType : "Бензин АИ-98",
                          volumeTank : 50,
                          fuelQuantity : 25,
                          accelerationOf100Km : 9.3,
                          bodyTapy : "Седан")

var lamborgini = SportCar (marka : "Ламборджини",
                          yearOfIssue : 2019,
                          color : "Синий",
                          mileage : 1000,
                          groundClearance : 100,
                          maxNumberOfPassengers : 2,
                          isPresenceOfHatch : false,
                          trunkVolume : 1000,
                          isEngineStarted : false,
                          isWindowOpen : false,
                          isTrunkFull : false,
                          fuelConsumption : 18.2,
                          fuelType : "Бензин АИ-100",
                          volumeTank : 150,
                          fuelQuantity : 30,
                          accelerationOf100Km : 5.3,
                          bodyTapy : "Седан")

var kamaz = TrunkCar(marka : "Камаз",
                     yearOfIssue : 1980,
                     color : "Зеленый",
                     mileage : 2000000,
                     groundClearance : 1500,
                     maxNumberOfPassengers : 4,
                     isPresenceOfHatch : false,
                     trunkVolume : 0,
                     isEngineStarted : false,
                     isWindowOpen : false,
                     isTrunkFull : false,
                     fuelConsumption : 30,
                     fuelType : "Дизель",
                     volumeTank : 300,
                     fuelQuantity : 50,
                     isPresenceOfTrailer : false,
                     bodyLength : 2000,
                     bodyHeight: 2000)

mustang.tyRun(by: ActionsWithCar.toRun)
print(mustang.isEngineStarted)


