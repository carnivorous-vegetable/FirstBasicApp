//
//  main.swift
//  RandomBingo
//
//  Created by Yachae on 1/15/24.
//

import Foundation

var computerChoice = Int.random(in: 1...100)

var myChoice: Int = 0

while true { // for문은 제한된 횟수만 가능하기 때문에 사용할 수 없다. while true는 무한히 반복된다.
    
    var userInput = readLine() // 옵셔널 스트링
    
    if let input = userInput { // 옵셔널 스트링을 벗겨서 스트링으로 만든다.
        if let number = Int(input) { // 스트링을 타입 변환해서 number 상수에 넣는다. 변환하는 문자열이 숫자로 바뀔수도 있고 바뀌지 않고 문자열이 될 수도 있기 때문에 옵셔널 인트로된다. 떄문에 한번 더 if let 바인딩을 사용
            myChoice = number
            
        }
    }
    
    if computerChoice > myChoice {
        print("UP")
    } else if computerChoice < myChoice {
        print("DOWN")
    } else {
        print("Bingo")
        break  // 빙고 출력하면 무한히 반복되는 while 반복문을 깬다.
    }
    
}
