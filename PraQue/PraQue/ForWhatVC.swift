//
//  ForWhatVC.swift
//  PraQue
//
//  Created by Marcelo Cristiano Araujo Silva on 10/04/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ForWhatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var actionSheetController = UIAlertController()
    
    
    let questions = [
        "Não tenho como saber se a proposta foi realizada",
        "Não sei o porquê dessa proposta"
    ]
    
    override func viewDidLoad() {
        self.createActionSheet()
    }
    
    func createActionSheet() {
        
        let message = "Ao confirmar será enviada uma solicitação de esclarecimento ao orgão responsável"
        self.actionSheetController = UIAlertController(title: "Opções", message: message, preferredStyle: .ActionSheet)
        
        //cancelar a ação
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .Cancel) { action -> Void in
        }
        self.actionSheetController.addAction(cancelAction)
        
        //chama a funcao share
        let shareAction: UIAlertAction = UIAlertAction(title: "Enviar Pergunta ao responsável", style: .Default) { action -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.actionSheetController.addAction(shareAction)
    }

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Question", forIndexPath: indexPath) as! ForWhatTableViewCell
        
        cell.questionLabel.text = questions[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.presentViewController(self.actionSheetController, animated: true, completion: nil)
    }
    
}
