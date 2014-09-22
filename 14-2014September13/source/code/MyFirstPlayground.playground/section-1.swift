// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//str = 1 // -> Error
//str = nil // -> Error


let gameTitle: String = "Flappy Swift"
//gameTitle = "Swift Valley" // -> Error


//String Interpolation
var numberOfLives = 99
var livesLabel = "You have \(numberOfLives - 1) lives remaining."


//Arrays
var levelNames = ["Green Hill", "Marble", "Spring Yard"]
var moreLevelNames: [String] = []
//levelNames = ["Labyrinth", 2] // -> Error

levelNames.count
levelNames.isEmpty
levelNames.first
levelNames.last
levelNames[0]

moreLevelNames.append("Star Light")
moreLevelNames
moreLevelNames.append("Final")
moreLevelNames

levelNames += moreLevelNames

let constantLevelNames: [String] = []
//constantLevelNames.append("Final") // -> Error

levelNames.insert("Labyrinth", atIndex: 3)
levelNames

levelNames[5] = "Scrap Brain"
levelNames

levelNames.removeAtIndex(5)


//Dictionaries

var bossNames = ["Emerald Hill": "Mecha", "Chemical Plant": "Water", "Aquatic Ruin": "Hammer"]
var moreBossNames: [String: String] = [:]
//var bossNames: [String: String] = ["Emerald Hill": "Mecha", "Chemical Plant": 1, "Aquatic Ruin": "Hammer"] // -> Error

bossNames.count
bossNames.isEmpty
bossNames["Chemical Plant"]
moreBossNames["Casino Night"] = "Catcher"
moreBossNames

let constantBossNames: [String: String] = [:]
//constantBossNames["Emerald Hill"] = "Drill" // -> Error
bossNames["Chemical Plant"] = nil
bossNames


//Tuples 

let alertMode = (4, "Red")
let evasionMode: (Int, String) = (3, "Orange")
let cautionMode = (level: 2, color: "Lime")

let alertColor = alertMode.1
let cautionColor = cautionMode.color

var normalMode = (1, "Blue")
normalMode.1 = "Green"
normalMode



//Range Operators

let moves = ["Tail Whip", "Thunder Shock"]
let moreMoves = ["Growl", "Play Nice"]
var moveSet = moves + moreMoves


moveSet[1...2]
moveSet[1..<2]


//Basic Control Flow

let elementalType = "Fire"

if elementalType == "Fire" {
    println("Use Water!")
}


if elementalType == "Fairy" {
    println("Use poison!")
} else {
    println("Draco Meteor!")
}


if elementalType == "Fairy" {
    println("Use poison!")
} else if elementalType == "Bug" {
    println("Kill it with fire!")
} else {
    println("Draco Meteor!")
}


switch elementalType {
case "Fairy":
    println("Use poison!")
case "Ice":
    println("Melt it with fire!")
default:
    println("More Draco Meteor.")
}


let fireType = "Fire"

switch fireType {
case "Fire":
    println("Go, Squirtle")
default:
    println("Your turn will never come, Pikachu…")
}


let baseAttack = 89

switch baseAttack {
case 1...30:
    println("Jus release it.")
case 31...70:
    println("Meh")
case 71...150:
    println("Now we're talking!.")
case 151...200:
    println("Uber!")
default:
    println("Hackemon!")
}

let baseSpecialAttack = 55
let baseMixedAttack = (baseAttack, baseSpecialAttack)

switch baseMixedAttack {
case (80...200, 80...200):
    println("Good mixed sweeper")
case (_, 80...200):
    println("Good special sweeper")
case (80...200, _):
    println("Good physical sweeper")
default:
    println("Not competitive enough.")
}


switch baseMixedAttack {
case let (attack, specialAttack) where attack == specialAttack:
    println("Perfectly balanced attack stats")
default:
    println("Unbalanced attack stats.")
}


//Optionals

var dropItemName: String?
dropItemName = "Wizard's Relic"
dropItemName = nil

dropItemName == nil

if dropItemName == nil {
    println("Out of luck.")
}


// Functions

func quarterCircleForward() {
    println("down")
    println("down-forward")
    println("forward")
}

quarterCircleForward()


//func quarterCircle(direction: String) {
//    println("down")
//    println("down-\(direction)")
//    println(direction)
//}
//
//quarterCircle("forward")


func canPerformSuperCombo(gauge: Float) -> Bool {
    return gauge == 1.0
}

canPerformSuperCombo(0.8)


func canPerformShinakuHadoken(gauge: Float, name: String) -> Bool {
    if name == "Ryu" || name == "Sakura" {
        return canPerformSuperCombo(gauge)
    } else {
        return false
    }
}

canPerformShinakuHadoken(1.0, "Ryu")


func canPerformUltraCombo(revengeGauge: Float) -> (Bool, damageMultiplier: Float) {
    if revengeGauge >= 0.5 {
        if revengeGauge == 1.0 {
            return (true, 1.5)
        } else {
            return (true, 1.0)
        }
    } else {
        return (false, 0)
    }
}

canPerformUltraCombo(0.6)



//External Parameter Names

//func quarterCircle(relativeDirection direction: String) {
//    println("down")
//    println("down-\(direction)")
//    println(direction)
//}
//
//quarterCircle(relativeDirection: "backward")


func quarterCircle(#direction: String = "down") {
    println("down")
    println("down-\(direction)")
    println(direction)
}

quarterCircle(direction: "backward")


//Variadic Parameters

func directionalInput(directions: String...) {
    for direction in directions {
        println(direction)
    }
}


directionalInput("down", "up")























