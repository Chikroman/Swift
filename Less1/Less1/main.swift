//
//  main.swift
//  Less1
//
//  Created by Роман Чикишев on 19.11.2021.
//

import Foundation

print("решение квадратного уравнения типа a*x*x+b*x+c")
print("введите коэффициент а")
let factorA=readLine()
print("введите коэффициент b")
let factorB=readLine()
print("введите коэффициент c")
let factorC=readLine()
let factorAstr=factorA ?? "ничего не введено в коэффициент а"
let factorBstr=factorB ?? "ничего не введено в коэффициент b"
let factorCstr=factorC ?? "ничего не введено в коэффициент c"

let factorADouble=Double(factorAstr) ?? 10
let factorBDouble=Double(factorBstr) ?? 10
let factorCDouble=Double(factorCstr) ?? 10

let diskriminant=(factorBDouble * factorBDouble-4 * factorADouble * factorCDouble)
let x1=(-factorBDouble-sqrt(abs(diskriminant))) / (2 * factorADouble)
let x2=(-factorBDouble+sqrt(abs(diskriminant))) / (2 * factorADouble)
print(x1)
print(x2)

//Задание 2
print("по введенным катетам найти S P и гипотенузу")
print("Введите катет A")
let catetA=readLine()
print("введите катет B")
let catetB=readLine()
let catetAstr=catetA ?? "не введен в катет а"
let catetBstr=catetB ?? "не введен в катет b"
let catetADouble=Double(catetAstr) ?? 10
let catetBDouble=Double(catetBstr) ?? 10
let square=0.5 * catetADouble * catetBDouble
print("площадь треугольника " + String(square) )
let gipotenuza=sqrt(catetADouble * catetADouble + catetBDouble * catetBDouble)
let perimetr=catetADouble + catetBDouble + gipotenuza
print("периметр треугольника " + String(perimetr) )
print("гипотенуза треугольника " + String(gipotenuza))

//Задание 3
print("по введенной сумма вклада и проценту рассчитать сумму вклада через 5 лет")
print("Введите сумму вклада")
let summ=readLine()
print("введите процент")
let procent=readLine()
let summstr=summ ?? "не введена сумма"
let procentstr=procent ?? "не введен процент"
let summDouble=Double(summstr) ?? 10
let procentDouble=Double(procentstr) ?? 10
let itog1year=summDouble * (1+procentDouble/100)
let itog2year=itog1year * (1+procentDouble/100)
let itog3year=itog2year * (1+procentDouble/100)
let itog4year=itog3year * (1+procentDouble/100)
let itog5year=itog4year * (1+procentDouble/100)
print("сумма вклада через 5 лет составит "+String(itog5year))

