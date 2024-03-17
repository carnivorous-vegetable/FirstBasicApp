//
//  ViewController.swift
//  RSPgame
//
//  Created by Yachae on 1/13/24.
//

import UIKit

class ViewController: UIViewController {

    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
   
    // 값이 확실하기 때문에 강제추출
    var comChioce: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    var myChoice: Rps = Rps.rock
    
    
    
    // 함수 // 매서드
    override func viewDidLoad() {
        super.viewDidLoad()
      // 1) 첫번쨰/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        //myImageView.image = UIImage(named: "ready.png") // 밑에 코드와 같음
        
      // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }

    @IBAction func rspButtonTapped(_ sender: UIButton) {
        // 가위/바위/보를 선택해서 그 정보를 저장해야됨⭐️
        // gurard let 바인딩으로 title에 정보를 저장
        guard let title = sender.currentTitle else {return}
//        let title = sender.currentTitle! // 버튼의 문자틀 ex(가위)를 가져온다.
        
        switch title {
        case "가위":
            // 가위 버튼을 누르면 가위 열거형이 저장
            myChoice = Rps.scissor
        case "바위":
            // 바위 버튼을 누르면 바위 열거형이 저장
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
        
    }
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        // 컴퓨터가 랜덤으로 선택한 것을 스위치문에 따라 코드가 작동하도록 구성
        switch comChioce {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "ready")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case .scissor:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
       
        
        // 3) 내가 선택한 것을 이미지뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissor:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단 표시
        if comChioce == myChoice {
            mainLabel.text = "비겼다"
        } else if comChioce == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChioce == .scissor && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
       
        // 3) 내 선택 이미지 뷰에도 준비이미지를 표시
        // 4) 내 선택 레이블에도 준비문자열을 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인레이블에도 "선택하세요"로 표시
        mainLabel.text = "선택하세요"
        
        //6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChioce = Rps(rawValue: Int.random(in: 0...2))!
    }

}

