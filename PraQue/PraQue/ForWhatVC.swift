//
//  ForWhatVC.swift
//  PraQue
//
//  Created by Marcelo Cristiano Araujo Silva on 10/04/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ForWhatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let questions = ["Questão 1", "Questão 2", "Questão 3"]

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ForWhatTableViewCell
        
        cell.questionLabel.text = questions[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let actionSheetController: UIAlertController = UIAlertController(title: "Opções", message: "Selecione a opção", preferredStyle: .ActionSheet)
        
        //cancelar a ação
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        
        //chama a funcao share
        let shareAction: UIAlertAction = UIAlertAction(title: "Enviar Pergunta ao responsável", style: .Default) { action -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheetController.addAction(shareAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
}
