//
//  SortingFunctionsFile.swift
//  HipoIntern
//
//  Created by Burak Ozay on 12.04.2021.
//

import Foundation


func selectionSort(array : inout [String], char : Character) {
    
    for i in array.indices {
        var max = i
        for j in i+1..<array.count {
            if compare(item1: array[j], item2: array[max], char: char) > 0 {
                max = j
            }
        }
        let temp = array[i]
        array[i] = array[max]
        array[max] = temp
    }
    
}
 
 func compare(item1 : String, item2 : String, char : Character) -> Int {
     return compareByCharacterCount(item1: item1,item2: item2,char: char)
 }
 
 func compareByCharacterCount(item1 : String, item2 : String, char : Character) -> Int {
    if item1.countChars(char: char) == item2.countChars(char: char) {
         return compareByLength(item1: item1,item2: item2)
     }
    if item1.countChars(char: char) > item2.countChars(char: char) {
            return 1
      }  else {
            return -1
      }
 }
     
 func compareByLength(item1 : String, item2 : String) -> Int {
     
     if item1.count == item2.count {
         return compareByAlphabetically(item1: item1, item2: item2)
     }

     if item1.count > item2.count {
            return  1
     } else {
            return -1
     }
 }
 
 func compareByAlphabetically(item1 : String, item2 : String) -> Int {
     if item1 < item2 {
        return  1
         
     }else {
        return -1
     }
     
 }

 extension String {
     func countChars(char : Character) -> Int {
         var counter = 0
         for c in self {
             if c == char {
                 counter+=1
             }
         }
         return counter
     }
 }
