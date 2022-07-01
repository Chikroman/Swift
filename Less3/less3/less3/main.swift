//
//  main.swift
//  less3
//
//  Created by Роман Чикишев on 26.11.2021.
//

import Foundation

//print("Hello, World!")

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

struct SportCar{
    var marka : String
    var yearOfIssue : Int
    var color : String
    var accelerationOf100Km : Double
    var mileage : Double
    var groundClearance : Double
    var bodyTapy : String
    var maxNumberOfPassengers : Int
    var presenceOfHatch : Bool
    var trunkVolume : Double
    var engineStarted : Bool
    var windowOpen : Bool
    var trunkFull : Bool
    var fuelConsumption : Double
    var fuelType : String
    var volumeTank : Int
    var fuelQuantity : Int
    
    mutating func openWindow(by open : ActionsWithCar){
        if open==ActionsWithCar.windowOpen{
            windowOpen = true
        }else{
            windowOpen = false
        }
    }
    mutating func tyRun(by run : ActionsWithCar){
        if run==ActionsWithCar.toRun{
            fuelQuantity -= 1
        }
    }

}

struct TrunkCar{
    var marka : String
    var yearOfIssue : Int
    var color : String
    var liftingCapacity : Double
    var mileage : Double
    var groundClearance : Double
    var bodyTapy : String
    var maxNumberOfPassengers : Int
    var presenceOfHatch : Bool
    var trunkVolume : Double
    var engineStarted : Bool
    var windowOpen : Bool
    var trunkFull : Bool
    var fuelConsumption : Double
    var fuelType : String
    var presenceOfTrailer : Bool
    var bodyLength : Int
    var bodyHeight : Int
    var volumeTank : Int
    
    mutating func unload(by run : ActionsWithCar){
        if run==ActionsWithCar.openTrunk{
            trunkFull = false
        }else{
            trunkFull = true
        }
    }

    
}

var sportCar1 = SportCar(marka: "Мустанг", yearOfIssue: 2020, color: "Красный", accelerationOf100Km: 7.3, mileage: 190000, groundClearance: 200, bodyTapy: "Купе", maxNumberOfPassengers: 2, presenceOfHatch: true, trunkVolume: 1000, engineStarted: false, windowOpen: false, trunkFull: false, fuelConsumption: 15.2, fuelType: "Бензин АИ-95", volumeTank: 100, fuelQuantity: 99)

var sportCar2 = SportCar(marka: "Ферарри", yearOfIssue: 2021, color: "Белый", accelerationOf100Km: 9.3, mileage: 200, groundClearance: 150, bodyTapy: "Седан", maxNumberOfPassengers: 4, presenceOfHatch: true, trunkVolume: 1500, engineStarted: false, windowOpen: false, trunkFull: false, fuelConsumption: 18.2, fuelType: "Бензин АИ-98", volumeTank: 50, fuelQuantity: 25)

var sportCar3 = SportCar(marka: "Ламборджини", yearOfIssue: 2019, color: "Синий", accelerationOf100Km: 5.3, mileage: 0, groundClearance: 100, bodyTapy: "Седан", maxNumberOfPassengers: 2, presenceOfHatch: true, trunkVolume: 1000, engineStarted: false, windowOpen: false, trunkFull: false, fuelConsumption: 18.2, fuelType: "Бензин АИ-100", volumeTank: 150, fuelQuantity: 30)

var trunkCar1 = TrunkCar(marka: "Камаз", yearOfIssue: 1980, color: "Зеленый", liftingCapacity: 150000, mileage: 20000000, groundClearance: 1500, bodyTapy: "Грузовик", maxNumberOfPassengers: 3, presenceOfHatch: true, trunkVolume: 0, engineStarted: false, windowOpen: false, trunkFull: true, fuelConsumption: 30, fuelType: "Дизель", presenceOfTrailer: true, bodyLength: 2000, bodyHeight: 2000, volumeTank: 300)

var trunkCar2 = TrunkCar(marka: "МАЗ", yearOfIssue: 1960, color: "Синий", liftingCapacity: 20000, mileage: 24000000, groundClearance: 1500, bodyTapy: "Грузовик", maxNumberOfPassengers: 3, presenceOfHatch: false, trunkVolume: 0, engineStarted: false, windowOpen: false, trunkFull: true, fuelConsumption: 30, fuelType: "Дизель", presenceOfTrailer: true, bodyLength: 4000, bodyHeight: 2000, volumeTank: 500)

var trunkCar3 = TrunkCar(marka: "МАН", yearOfIssue: 1990, color: "Черный", liftingCapacity: 300000, mileage: 1500000, groundClearance: 3000, bodyTapy: "Грузовик", maxNumberOfPassengers: 3, presenceOfHatch: true, trunkVolume: 0, engineStarted: false, windowOpen: false, trunkFull: true, fuelConsumption: 30, fuelType: "Дизель", presenceOfTrailer: true, bodyLength: 5000, bodyHeight: 2000, volumeTank: 100)

sportCar1.openWindow(by: ActionsWithCar.windowOpen)
print(sportCar1)

sportCar2.openWindow(by: ActionsWithCar.windowOpen)
print(sportCar2)

sportCar3.openWindow(by: ActionsWithCar.windowOpen)
print(sportCar3)

sportCar1.openWindow(by: ActionsWithCar.windowClose)
print(sportCar1)

sportCar2.openWindow(by: ActionsWithCar.windowClose)
print(sportCar1)

sportCar3.openWindow(by: ActionsWithCar.windowClose)
print(sportCar1)

sportCar1.tyRun(by: ActionsWithCar.toRun)
print(sportCar1)

sportCar1.tyRun(by: ActionsWithCar.toRun)
print(sportCar1)

sportCar1.tyRun(by: ActionsWithCar.toRun)
print(sportCar1)

sportCar2.tyRun(by: ActionsWithCar.toRun)
print(sportCar2)

sportCar2.tyRun(by: ActionsWithCar.toRun)
print(sportCar2)

sportCar2.tyRun(by: ActionsWithCar.toRun)
print(sportCar2)

sportCar3.tyRun(by: ActionsWithCar.toRun)
print(sportCar3)

trunkCar1.unload(by: ActionsWithCar.openTrunk)
print(trunkCar1)

trunkCar2.unload(by: ActionsWithCar.openTrunk)
print(trunkCar2)

trunkCar3.unload(by: ActionsWithCar.openTrunk)
print(trunkCar3)

sportCar1.color = "Зеленый"
print(sportCar1)
print(sportCar1.color)


