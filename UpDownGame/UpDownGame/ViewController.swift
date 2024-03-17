//
//  ViewController.swift
//  UpDownGame
//
//  Created by Yachae on 1/15/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 변수를 만들어서 컴퓨터가 랜덤으로 수를 생성하게 한다.
    var comNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자를 담는 변수 (선택)
//    var myNumber: Int = 1
    
    // 앱에 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        // 1) 메인레이블에 "선택하세요"
        // 2) 숫자 레이블은 "" 빈공간
     
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1)버튼의 숫자를 가져와야 함
        //파라미터이름이 sender이기 때문에 파라미터이름으로 접근
        guard let numString = sender.currentTitle else { return } // 문자열로 반환된다.
        
        // 2)숫자 버튼을 눌렀을 때 아래의 레이블을 변하게 만들어야 함
        numberLabel.text = numString
        
        // 3)선택한 숫자를 변수에다가 저장 (선택)
//        guard let num = Int(numString) else { return } 
        // 정수형으로 변형이 되지 않을 수 있어서 옵셔널로 되기 때문에 가드문 바인딩으로 값을 저장한다.
        
//        myNumber = num
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let myNumString = numberLabel.text else { return } 
        // 옵셔널 문자열이기 때문에 벗겨서 사용
        guard let myNumber = Int(myNumString) else { return } 
        // 정수형으로 안바뀔수도 있기 때문에 가드문바인딩 사용
        
        
        
        // 컴퓨터의 숫자와 내가 선택한 숫자를 비교 UP/ DOWN Bingo 를 메인레이블에 표시
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "Bingo🤩"
        }
        
        
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 메인레이블에 선택하세요를 다시 출력 
        mainLabel.text = "선택하세요"
        // 2) 컴퓨터의 랜덤숫자를 다시 선택하게
        comNumber = Int.random(in: 1...10)
        // 3) 숫자레이블을 빈문자열 ""로 초기화
        numberLabel.text = ""
    }
    
    
}

