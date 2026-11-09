//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Delvina Jenoline on 03/11/26.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleBut1: UIButton!
    @IBOutlet var singleBut2: UIButton!
    @IBOutlet var singlebut3: UIButton!
    @IBOutlet var singleBut4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLab1: UILabel!
    @IBOutlet var multiLab2: UILabel!
    @IBOutlet var multiLab3: UILabel!
    @IBOutlet var multiLab4: UILabel!
    
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var rangedLab1: UILabel!
    @IBOutlet var rangedLab2: UILabel!
    
    @IBOutlet var questionProgView: UIProgressView!
    
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var mutliSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    @IBOutlet var rangedSlider: UISlider!
    
    
    var questionIndex = 0
    
    var questions: [Question] = [Question(text: "Which food do you like the most?", type: .single, answer: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .cat),
        Answer(text: "Carrots", type: .rabbit),
        Answer(text: "Corn", type: .turtle)
    ]),

        Question(text: "Which Activity do you enjoy the most?", type: .mulitple, answer: [
            
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
    ]),
                                 
        Question(text: "How do you enjoy car rides", type: .ranged, answer: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
    ])
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()


    }
    
    @IBAction func SingleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        
        case singleBut1: answersChoosen.append(currentAnswers[0])
        case singleBut2: answersChoosen.append(currentAnswers[1])
        case singlebut3: answersChoosen.append(currentAnswers[2])
        case singleBut4: answersChoosen.append(currentAnswers[3])
            
        default:
            break
        }
        
        nextQuestion()
        
    }
    
    @IBAction func multiAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answer
        
        if multiSwitch1.isOn {
            answersChoosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChoosen.append(currentAnswers[1])
        }
        if mutliSwitch3.isOn {
            answersChoosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChoosen.append(currentAnswers[3])
        }
        
        nextQuestion()
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
        
    }
    
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }
        else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case.single: updateSingleStacks(using: currentAnswer)
        case.mulitple : updateMultipleStack(using: currentAnswer)
        case.ranged : updateRangedStack(using: currentAnswer)
            
        }
        
    }
    
    func updateSingleStacks(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleBut1.setTitle(answers[0].text, for: .normal)
        singleBut2.setTitle(answers[1].text, for: .normal)
        singlebut3.setTitle(answers[2].text, for: .normal)
        singleBut4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        mutliSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLab1.text = answers[0].text
        multiLab2.text = answers[1].text
        multiLab3.text = answers[2].text
        multiLab4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: true)
        rangedLab1.text = answers.first?.text
        rangedLab2.text = answers.last?.text
    }
    
    var answersChoosen: [Answer] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            
            let resultVC = segue.destination as! ResultsViewController
            resultVC.response = answersChoosen
        }
    }


}
