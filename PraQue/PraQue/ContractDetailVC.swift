//
//  ContractDetailVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ContractDetailVC: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.rowHeight = 240
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
            self.shareSheet()
        }
        actionSheetController.addAction(shareAction)
        
        //chama a funcao report
        let reportAction: UIAlertAction = UIAlertAction(title: "Relato", style: .Default) { action -> Void in
            self.presentView("Report")
        }
        actionSheetController.addAction(reportAction)
        
        //chama a funcao fallow
        let fallowAction: UIAlertAction = UIAlertAction(title: "Seguir", style: .Default) { action -> Void in
            self.followContratact()
        }
        actionSheetController.addAction(fallowAction)
        
        //chama funcao forWhat
        let forWhatAction: UIAlertAction = UIAlertAction(title: "Pra quê?", style: .Default) { action -> Void in
            self.presentView("ForWhat")
        }
        actionSheetController.addAction(forWhatAction)
        
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    
    
    
    
    func followContratact(){
    
        let favoriteContract: UIAlertController = UIAlertController(title: "Seguir Convênio", message: "Esse convênio foi adicionado aos seus favoritos,você receberá notificações quando ocorrerem mudanças no mesmo.", preferredStyle: UIAlertControllerStyle.Alert)
        let action: UIAlertAction = UIAlertAction(title: "ok", style: .Default) { action -> Void in
        }
        favoriteContract.addAction(action)
        //Present the AlertController
        self.presentViewController(favoriteContract, animated: true, completion: nil)

    }
    
    
    //funcoes de apresentaão de view
    func presentView(name: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "ContractList", bundle: nil)
        var viewController = storyBoard.instantiateViewControllerWithIdentifier(name)
        
        switch name {
        case "Report":
            viewController = viewController as! ReportVC
        case "ForWhat":
            viewController = viewController as! ForWhatVC
        default:
            assert(false, "Não foi possível instanciar uma view nos detelhes do contrato")
        }
        
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    //share options
    func shareSheet(){
    
        let firstActivityItem = ""
        let secondActivityItem : NSURL = NSURL(string: "URL")!
        // If you want to put an image
        let image : UIImage = UIImage(named: "ObraExemplo")!
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypeAssignToContact,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToTencentWeibo
        ]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)

    }
    
    
    
    
    
    
    
    //funcoes tableview
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("dataCell", forIndexPath: indexPath)
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("descriptionCell", forIndexPath: indexPath)
        case 2:
            cell = tableView.dequeueReusableCellWithIdentifier("goalCell", forIndexPath: indexPath)
        default:
            assert(false, "TableView da Detail com erro na hora de criar a célula")
        }
        
        return cell
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRectZero)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
