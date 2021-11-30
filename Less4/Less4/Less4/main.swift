//
//  main.swift
//  Less4
//
//  Created by Роман Чикишев on 30.11.2021.
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

class Car {
    var marka : String
    var yearOfIssue : Int
    var color : String
    var mileage : Double
    var groundClearance : Double
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
    init (marka : String,
          yearOfIssue : Int,
          color : String,
          mileage : Double,
          groundClearance : Double,
          maxNumberOfPassengers : Int,
          presenceOfHatch : Bool,
          trunkVolume : Double,
          engineStarted : Bool,
          windowOpen : Bool,
          trunkFull : Bool,
          fuelConsumption : Double,
          fuelType : String,
          volumeTank : Int,
          fuelQuantity : Int){
        self.marka = marka
        self.yearOfIssue = yearOfIssue
        self.color = color
        self.mileage = mileage
        self.groundClearance = groundClearance
        self.maxNumberOfPassengers = maxNumberOfPassengers
        self.presenceOfHatch = presenceOfHatch
        self.trunkVolume = trunkVolume
        self.engineStarted = engineStarted
        self.windowOpen = windowOpen
        self.trunkFull = trunkFull
        self.fuelConsumption = fuelConsumption
        self.fuelType = fuelType
        self.volumeTank = volumeTank
        self.fuelQuantity = fuelQuantity
    }
    func tyRun(by run : ActionsWithCar){
        if run == .toRun{
            fuelQuantity -= 1
        }
    }
}

class SportCar : Car {
        var accelerationOf100Km : Double
        var bodyTapy : String
    init (marka : String,
          yearOfIssue : Int,
          color : String,
          mileage : Double,
          groundClearance : Double,
          maxNumberOfPassengers : Int,
          presenceOfHatch : Bool,
          trunkVolume : Double,
          engineStarted : Bool,
          windowOpen : Bool,
          trunkFull : Bool,
          fuelConsumption : Double,
          fuelType : String,
          volumeTank : Int,
          fuelQuantity : Int,
          accelerationOf100Km : Double,
          bodyTapy : String){
        self.accelerationOf100Km = accelerationOf100Km
        self.bodyTapy = bodyTapy
        super.init (marka : marka,
                    yearOfIssue : yearOfIssue,
                    color : color,
                    mileage : mileage,
                    groundClearance : groundClearance,
                    maxNumberOfPassengers : maxNumberOfPassengers,
                    presenceOfHatch : presenceOfHatch,
                    trunkVolume : trunkVolume,
                    engineStarted : engineStarted,
                    windowOpen : windowOpen,
                    trunkFull : trunkFull,
                    fuelConsumption : fuelConsumption,
                    fuelType : fuelType,
                    volumeTank : volumeTank,
                    fuelQuantity : fuelQuantity)
    }
    func openWindow(by open : ActionsWithCar){
        if open == .windowOpen{
            windowOpen = true
        }
    }
}

class TrunkCar : Car{
    var presenceOfTrailer : Bool
    var bodyLength : Int
    var bodyHeight : Int
    init (marka : String,
          yearOfIssue : Int,
          color : String,
          mileage : Double,
          groundClearance : Double,
          maxNumberOfPassengers : Int,
          presenceOfHatch : Bool,
          trunkVolume : Double,
          engineStarted : Bool,
          windowOpen : Bool,
          trunkFull : Bool,
          fuelConsumption : Double,
          fuelType : String,
          volumeTank : Int,
          fuelQuantity : Int,
          presenceOfTrailer : Bool,
          bodyLength : Int,
          bodyHeight : Int){
        self.presenceOfTrailer = presenceOfTrailer
        self.bodyLength = bodyLength
        self.bodyHeight = bodyHeight
        super.init (marka : marka,
                    yearOfIssue : yearOfIssue,
                    color : color,
                    mileage : mileage,
                    groundClearance : groundClearance,
                    maxNumberOfPassengers : maxNumberOfPassengers,
                    presenceOfHatch : presenceOfHatch,
                    trunkVolume : trunkVolume,
                    engineStarted : engineStarted,
                    windowOpen : windowOpen,
                    trunkFull : trunkFull,
                    fuelConsumption : fuelConsumption,
                    fuelType : fuelType,
                    volumeTank : volumeTank,
                    fuelQuantity : fuelQuantity)
    }
    func unload(by run : ActionsWithCar){
        if run == .openTrunk{
            trunkFull = false
        }else{
            trunkFull = true
        }
    }
}

var sportCar1 = SportCar (marka : "Мустанг",
                          yearOfIssue : 2020,
                          color : "Красный",
                          mileage : 19000,
                          groundClearance : 200,
                          maxNumberOfPassengers : 2,
                          presenceOfHatch : false,
                          trunkVolume : 1000,
                          engineStarted : false,
                          windowOpen : false,
                          trunkFull : false,
                          fuelConsumption : 15.2,
                          fuelType : "Бензин АИ-95",
                          volumeTank : 100,
                          fuelQuantity : 99,
                          accelerationOf100Km : 7.3,
                          bodyTapy : "Купе")

var sportCar2 = SportCar (marka : "Ферарри",
                          yearOfIssue : 2021,
                          color : "Белый",
                          mileage : 19000,
                          groundClearance : 200,
                          maxNumberOfPassengers : 4,
                          presenceOfHatch : false,
                          trunkVolume : 1000,
                          engineStarted : false,
                          windowOpen : false,
                          trunkFull : false,
                          fuelConsumption : 18.2,
                          fuelType : "Бензин АИ-98",
                          volumeTank : 50,
                          fuelQuantity : 25,
                          accelerationOf100Km : 9.3,
                          bodyTapy : "Седан")

var sportCar3 = SportCar (marka : "Ламборджини",
                          yearOfIssue : 2019,
                          color : "Синий",
                          mileage : 1000,
                          groundClearance : 100,
                          maxNumberOfPassengers : 2,
                          presenceOfHatch : false,
                          trunkVolume : 1000,
                          engineStarted : false,
                          windowOpen : false,
                          trunkFull : false,
                          fuelConsumption : 18.2,
                          fuelType : "Бензин АИ-100",
                          volumeTank : 150,
                          fuelQuantity : 30,
                          accelerationOf100Km : 5.3,
                          bodyTapy : "Седан")

var trunkCar1 = TrunkCar(marka : "Камаз",
                         yearOfIssue : 1980,
                         color : "Зеленый",
                         mileage : 2000000,
                         groundClearance : 1500,
                         maxNumberOfPassengers : 4,
                         presenceOfHatch : false,
                         trunkVolume : 0,
                         engineStarted : false,
                         windowOpen : false,
                         trunkFull : false,
                         fuelConsumption : 30,
                         fuelType : "Дизель",
                         volumeTank : 300,
                         fuelQuantity : 50,
                         presenceOfTrailer : false,
                         bodyLength : 2000,
                         bodyHeight: 2000)

sportCar1.openWindow(by: ActionsWithCar.windowOpen)
print(sportCar1.windowOpen)
