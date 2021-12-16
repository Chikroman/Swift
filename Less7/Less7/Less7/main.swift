//
//  main.swift
//  Less7
//
//  Created by Роман Чикишев on 16.12.2021.
//

import Foundation

enum FibonachiEror: Error {
    case error
}

class Fibonachi {
    private var rowFibonachi : [Int] = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987]
    
    func elementFibonachi(index : Int) -> Int? {
        return rowFibonachi[index]
    }
    
    func elementFibonachiThrows(index : Int) throws -> Int {
        guard rowFibonachi[index] != nil else { throw FibonachiEror.error }
        return rowFibonachi[index]
    }
}

var rowFibonachi: Fibonachi? = Fibonachi()
let index = 10
let elementFibonachi = rowFibonachi?.elementFibonachi(index: index)

if  elementFibonachi == nil {
    print("Error")
}else {
    print(elementFibonachi)}

func guardFunc(rowFibonachi: Fibonachi?) {
    guard let rowFibonachi = rowFibonachi else { return }
    print (rowFibonachi.elementFibonachi(index: 10))
    
}

do {
    try rowFibonachi?.elementFibonachiThrows(index: index)
} catch let error {
    print(error.localizedDescription)
}
