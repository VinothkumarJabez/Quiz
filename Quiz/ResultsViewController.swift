//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Delvina Jenoline on 03/11/26.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var response: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

        
    }
    
    func calculatePersonalityResult() {
        
        var frequencyOfAnswers: [AnimalType:Int] = [:]
        let responseTypes = response.map{$0.type}
        
        for newResponse in responseTypes {
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[newResponse] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            
            frequencyOfAnswers[newResponse] = newCount
        }
        
        let frequencyAnswerSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    


}
