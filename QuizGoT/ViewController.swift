//
//  ViewController.swift
//  QuizGoT
//
//  Created by Samuel Dias Fernandes de Oliveira on 29/07/16.
//  Copyright © 2016 samueldfo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions : [Question]! // Vetor que contem as questões
    var currentQuestion = 0 // Int que indica qual a questão atual
    var grade = 0.0 // Double para o cáculo da nota
    var quizEnded = false // Bollean que indica se o quiz terminou ou não
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let q0answer0 = Answer(answer: "Um Lannister sempre paga as suas dívidas", isCorrect: false)
        let q0answer1 = Answer(answer: "Nós sempre ganhamos, sempre", isCorrect: false)
        let q0answer2 = Answer(answer: "Insubmissos, não curvados, não quebrados", isCorrect: false)
        let q0answer3 = Answer(answer: "Ouça me rugir", isCorrect: true)
        let question0 = Question(question: "Qual é o lema da Casa Lannister?", strImageFileName: "Pergunta 1", answers: [q0answer0,q0answer1,q0answer2,q0answer3])
    
        let q1answer0 = Answer(answer: "Rhaegal", isCorrect: false)
        let q1answer1 = Answer(answer: "Dracarys", isCorrect: false)
        let q1answer2 = Answer(answer: "Viserion", isCorrect: false)
        let q1answer3 = Answer(answer: "Drogon", isCorrect: true)
        let question1 = Question(question: "Qual dos dragões de Daenerys é o maior?", strImageFileName: "Pergunta 2", answers: [q1answer0,q1answer1,q1answer2,q1answer3])
        
        let q2answer0 = Answer(answer: "Tywin Lannister", isCorrect: false)
        let q2answer1 = Answer(answer: "Jon Arryn", isCorrect: false)
        let q2answer2 = Answer(answer: "Eddard Stark", isCorrect: false)
        let q2answer3 = Answer(answer: "Petyr Baelish “Mindinho”", isCorrect: true)
        let question2 = Question(question: "Quem não foi mão do Rei?", strImageFileName: "Pergunta 3", answers: [q2answer0,q2answer1,q2answer2,q2answer3])
        
        let q3answer0 = Answer(answer: "Greyjoy", isCorrect: false)
        let q3answer1 = Answer(answer: "Tyrell", isCorrect: false)
        let q3answer2 = Answer(answer: "Arryn", isCorrect: false)
        let q3answer3 = Answer(answer: "Tully", isCorrect: true)
        let question3 = Question(question: "O símbolo abaixo representa qual casa?", strImageFileName: "Pergunta 4", answers: [q3answer0,q3answer1,q3answer2,q3answer3])
    
        let q4answer0 = Answer(answer: "Fantasma", isCorrect: false)
        let q4answer1 = Answer(answer: "Nymeria", isCorrect: false)
        let q4answer2 = Answer(answer: "Verão", isCorrect: false)
        let q4answer3 = Answer(answer: "Vento Cinzento", isCorrect: true)
        let question4 = Question(question: "Qual o nome do lobo de Robb Stark?", strImageFileName: "Pergunta 5", answers: [q4answer0,q4answer1,q4answer2,q4answer3])
    
        let q5answer0 = Answer(answer: "Gelo", isCorrect: false)
        let q5answer1 = Answer(answer: "Cumpridora de Promessas", isCorrect: false)
        let q5answer2 = Answer(answer: "Luminífera", isCorrect: false)
        let q5answer3 = Answer(answer: "Agulha", isCorrect: true)
        let question5 = Question(question: "Qual o nome da espada de Arya Stark?", strImageFileName: "Pergunta 6", answers: [q5answer0,q5answer1,q5answer2,q5answer3])
        
        questions = [question0,question1,question2,question3,question4,question5]
        
        startQuiz() // começa o quiz
    }

    //funcão que reseta o quiz
   
    func startQuiz(){
        
        questions.shuffle() //embaralha o vetor de perguntas
        for i in 0 ..< questions.count {
            questions[i].answers.shuffle() //embaralha o vetor de respostas para cada pergunta
        }
        
        //reseta variáveis de progresso do usuário
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0) //mostra a primeira questão
        
    }
    
    //função que atualiza os objetos da tela com os dados do vetor de questões
    
    func showQuestion(questionId: Int){
        
        btnAnswer1.titleLabel!.adjustsFontSizeToFitWidth = true
        btnAnswer2.titleLabel!.adjustsFontSizeToFitWidth = true
        btnAnswer3.titleLabel!.adjustsFontSizeToFitWidth = true
        btnAnswer4.titleLabel!.adjustsFontSizeToFitWidth = true
        
        btnAnswer1.titleLabel!.textAlignment = .Center
        btnAnswer2.titleLabel!.textAlignment = .Center
        btnAnswer3.titleLabel!.textAlignment = .Center
        btnAnswer4.titleLabel!.textAlignment = .Center
        
        btnAnswer1.titleLabel!.numberOfLines = 0
        btnAnswer2.titleLabel!.numberOfLines = 0
        btnAnswer3.titleLabel!.numberOfLines = 0
        btnAnswer4.titleLabel!.numberOfLines = 0
        
        btnAnswer1.enabled = true
        btnAnswer2.enabled = true
        btnAnswer3.enabled = true
        btnAnswer4.enabled = true
        
        //atualiza o lb da questão, imagem e o lbl dos botões de alternativas
        lbQuestion.text = questions[questionId].strQuestion
        imgQuestion.image = questions[questionId].imgQuestion
        btnAnswer1.setTitle(questions[questionId].answers[0].strAnswer, forState: UIControlState.Normal)
        btnAnswer2.setTitle(questions[questionId].answers[1].strAnswer, forState: UIControlState.Normal)
        btnAnswer3.setTitle(questions[questionId].answers[2].strAnswer, forState: UIControlState.Normal)
        btnAnswer4.setTitle(questions[questionId].answers[3].strAnswer, forState: UIControlState.Normal)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func chooseAnswer1(sender: AnyObject) {
        selectAnswer(0)
    }
    
    
    @IBAction func chooseAnswer2(sender: AnyObject) {
        selectAnswer(1)
    }
    
    
    @IBAction func chooseAnswer3(sender: AnyObject) {
        selectAnswer(2)
    }
    
    
    @IBAction func chooseAnswer4(sender: AnyObject) {
        selectAnswer(3)
    }
    
    
    // função que seleciona uma alternativa
    
    func selectAnswer(answerId: Int){
       
        //desabilita os botões de resposta para não clicar 2 vezes
        btnAnswer1.enabled = false
        btnAnswer2.enabled = false
        btnAnswer3.enabled = false
        btnAnswer4.enabled = false
        
        viewFeedback.hidden = false // mostra viewFeedBack
        
        var answer : Answer = questions[currentQuestion].answers[answerId] //seleciona reposta
        
        if(answer.isCorrect == true){
            grade = grade + 1.0 //soma 1 ponto caso resposta correta
            lbFeedback.text = answer.strAnswer + "\n\nResposta correta!" //altera lb feedback: resposta correta
        }else{
            lbFeedback.text = answer.strAnswer + "\n\nResposta errada..." //altera lb feedback: resposta errada
        }
        
        if(currentQuestion < questions.count-1){
            btnFeedback.setTitle("Próxima", forState: UIControlState.Normal) //caso a questão atual não seja a última, altera o lb do btn feedback para: Proxima
        }else{
            btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal) //caso a questão atual seja a última, altera o lb do btn feedback para: Ver Nota
        }
        
    }
    
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
        viewFeedback.hidden = true //esconde view feedback
        
        if(quizEnded){
            startQuiz() //se quiz terminou, recomeça
        }else{
            nextQuestion() //se não terminou, mostra a próxima questão
        }
    }
    
    //funcão que mostra a próxima questão ou o final do quiz
    func nextQuestion(){
        currentQuestion += 1 // incrementa em 1 o valor da variável de questão atual
        
        if(currentQuestion < questions.count){
            //se a questão atual é menor que o número total de questões , mostra a próxima
            showQuestion(currentQuestion)
        }else{
            endQuiz()
            //se a questão atual é igual ao número total de questões, termina o quiz
        }
    }
    
    //funcão que termina o Quiz
    func endQuiz(){
    
        grade = grade / Double(questions.count) * 100.0 //cálculo da nota de 0 a 100
        quizEnded = true //atualiza variável booleana que indica que terminou o quiz
        viewFeedback.hidden = false // mostra o view Feedback
        lbFeedback.text = "Sua nota foi \(grade)" //atualiza texto de feedback mostrando a nota
        btnFeedback.setTitle("Refazer", forState: UIControlState.Normal) //atualiza o lb do btn Feedback
    }
}

