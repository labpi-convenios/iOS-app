//
//  ContractDetailVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ContractDetailVC: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.optionButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func optionButton() {
        let rightBarButton = UIBarButtonItem(title: "Opções", style: .Done, target: self, action: Selector("options"))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func options() {
        //criando AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Opções", message: "Selecione a opção", preferredStyle: .ActionSheet)
        
        //cancelar a ação
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        
        //chama a funcao share
        let shareAction: UIAlertAction = UIAlertAction(title: "Compartilhar", style: .Default) { action -> Void in
//            self.share()
        }
        actionSheetController.addAction(shareAction)
        
        //chama a funcao report
        let reportAction: UIAlertAction = UIAlertAction(title: "Relato", style: .Default) { action -> Void in
            self.report()
        }
        actionSheetController.addAction(reportAction)
        
        //chama a funcao fallow
        let fallowAction: UIAlertAction = UIAlertAction(title: "Seguir", style: .Default) { action -> Void in
//            self.fallow()
        }
        actionSheetController.addAction(fallowAction)
        
        //chama funcao forWhat
        let forWhatAction: UIAlertAction = UIAlertAction(title: "Pra quê?", style: .Default) { action -> Void in
//            self.forWhat()
        }
        actionSheetController.addAction(forWhatAction)
        
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    func report() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "ContractList", bundle: nil)
        
        let reportViewController = storyBoard.instantiateViewControllerWithIdentifier("Report") as! ReportVC
        self.presentViewController(reportViewController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
