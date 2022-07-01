//
//  main.swift
//  les2
//
//  Created by Роман Чикишев on 23.11.2021.
//

import Foundation
// Проверка на четное число
func chetnechet(number: Int) -> Bool{
    if number % 2 == 0 {
        return true
    }else{
        return false
    }
}
//Проверка деления на 3
func devisionByThree(number: Int) -> Bool{
    if number % 3 == 0 {
        return true
    }else{
        return false
    }
}

//Создать массив из 100 чисел
func createArray() -> Array<Int>{
    var newArray : [Int] = []
    for _ in 1...100 {
        newArray.append(Int.random(in: 1...1000))
    }
    return newArray
}

//Новый массив в котором нет четных элементов или число делится на 3
func necheetAndNodevisionByThree() -> Array<Int>{
    var sourceArray=createArray()
    for (index,number) in sourceArray.enumerated() {
        if chetnechet(number: number) || devisionByThree(number: number){
            sourceArray.remove(at: index)
        }
    }
    return sourceArray
}
//функция добавляет новый элемент в ряд фибоначи
func newNumberFibonachi(rowFibonachi : Array<Int>) -> Array<Int>{
    var newRouFibonachi=rowFibonachi
    if newRouFibonachi.isEmpty {
        newRouFibonachi.append(0)
    }else if newRouFibonachi.count == 1 || newRouFibonachi.count == 2 {
        newRouFibonachi.append(1)
    }else{
        let newElement=newRouFibonachi[newRouFibonachi.count-2] + newRouFibonachi[newRouFibonachi.count-1]
        newRouFibonachi.append(newElement)
    }
    return newRouFibonachi
}
// создаем ряд фибоначи из 50 элементов и выводим
var rowFibonachi : [Int] = []
for _ in 1...50 {
    rowFibonachi=newNumberFibonachi(rowFibonachi: rowFibonachi)
}
print(rowFibonachi)

//функция проверяет на простое число, передаваемый массив содержит простые числа
func checkprimeNumber(primeArray : Array<Int>,primeNumber:Int) -> Bool{
    var answer = true
    for (_,number) in primeArray.enumerated() {
        if primeNumber % number == 0{
            answer = false
        }
    }
    return answer
}

//добавляем в массив 100 простых чисел
var arrayPrimeNumber : [Int] = []
arrayPrimeNumber.append(2)
arrayPrimeNumber.append(3)
arrayPrimeNumber.append(5)
arrayPrimeNumber.append(7)
while arrayPrimeNumber.count < 100{
    let number = Int.random(in: 1...4000)
    if checkprimeNumber(primeArray: arrayPrimeNumber, primeNumber: number){
        arrayPrimeNumber.append(number)
    }
}
print(arrayPrimeNumber)
