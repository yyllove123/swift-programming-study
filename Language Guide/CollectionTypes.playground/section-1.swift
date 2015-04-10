// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var shoppingList = ["Eggs", "Milk"]

println("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty
{
    println("The shopping list is empty.")
}
else
{
    println("The shopping list is not empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Banans", "Apples"]
shoppingList[0..<1] = ["ACB", shoppingList[0]]
shoppingList

var dic = ["one": 1, "two" : "abc"]