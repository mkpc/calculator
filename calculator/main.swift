//
//  main.swift
//  calculator
//
//  Created by marco cheng on 10/8/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

/*
user can enter a number, hit return
user can enter an operation (add, sub, mul, div, mod),then return
user can enter a number, hit return•program calculates the result

------------------
Example:
$ calc
"Enter an expression separated by returns:"
15
+
27
Result: 42
------------------
*/

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

let firstNum = input()


var simpleCal = false
let operationCount = 0
var answer = 0

//put evenything to an array, ans split by space
var inputArr = firstNum.characters.split{$0 == " "}.map(String.init)

func simpleOperation (operation: String, firstNum: String, secoundNum: String){
    //+, -, *, /, %
    switch operation{
    case "+" : print(convert(firstNum) + convert(secoundNum))
    case "-" : print(convert(firstNum) - convert(secoundNum))
    case "*" : print(convert(firstNum) * convert(secoundNum))
    case "/" : print(convert(firstNum) / convert(secoundNum))
    case "%" : print(convert(firstNum) % convert(secoundNum))
    default: print("Invaild operator input :\(operation)")
        break
    }
}

func extendedOperation(){
    //count, avg, fact
    let extendedOperator = inputArr.popLast()!
    
    switch extendedOperator{
    case "count" : print(inputArr.count)
        break
    case "avg" : print(avg())
        break
    case "fact" : print(fact(convert(inputArr[0])))
    default: print("Invaild operator input :\(extendedOperator)")
        break
    }
}

func avg()->String{
    var avgAnwer = 0
    for number in inputArr{
        avgAnwer =  avgAnwer + convert(number)
    }
    avgAnwer = avgAnwer/inputArr.count
    return String(avgAnwer)
}

func fact(number : Int)->Int{
    return number == 0 ? 1 : number * fact(number-1)
}

if inputArr.count>1{
    simpleCal = false
    extendedOperation()
    
}else{
    simpleCal = true
    var operation = input()
    let secondNum = input()
    simpleOperation(operation , firstNum: firstNum , secoundNum: secondNum )
}















