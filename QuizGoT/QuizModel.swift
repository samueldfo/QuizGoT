//
//  QuizModel.swift
//  QuizGoT
//
//  Created by Samuel Dias Fernandes de Oliveira on 29/07/16.
//  Copyright © 2016 samueldfo. All rights reserved.
//

import Foundation
import UIKit

class Question{
    
    var strQuestion: String! // String para armazenar texto da questão
    var imgQuestion: UIImage! // UIImage para armazenar a imagem ilustrativa da pergunta
    var answers: [Answer]! // Vetor de objetos da classe Answers para armazenar as respostas
    
    //função que inicia o objeto da classe Question
    init(question: String, strImageFileName: String, answers:[Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFileName)
        self.answers = answers
        
    }
    
}

class Answer{
    var strAnswer: String! // String para armazenar a resposta
    var isCorrect: Bool! // Bolleana para armazenar se a resposta é verdadeira ou falsa
    
    //função que inicia o objeto da classe Answer
    init(answer: String, isCorrect: Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
    }
    
    
}