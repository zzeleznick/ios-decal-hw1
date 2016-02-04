//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String!, wordB: String!) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: Yes, we have forced them to both be strings and it will fail otherwise.

//: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map( {String($0.characters.reverse())})
        let numElements = words.count
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### a. Why does the compiler dislike the **for loop**? Fix it.
//: ### b. What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: a. i should be a var and not a let, since we want to increment i
//: b. we should return a value since it specifies to return a bool
//: additionally, we need to fix map so that it's called correctly

//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters = [Character : Int]() //Line X
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: We must have a non-nil dictionary of characters mapped to integer values, and should
//: NOT try to access elements that to don't exist. In this case, we initialize the dict.
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.

var zz = Words(wordA: "wow",wordB: "wow")
Words.arePalindromes(["wow", "wow"])
print("hello world")
// used http://www.dotnetperls.com/dictionary-swift as a reference.

// methodA
// Foo.methodA(bar: Int = 5)

//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
