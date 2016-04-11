//
//  ReportVC.swift
//  PraQue
//
//  Created by Marcelo Cristiano Araujo Silva on 10/04/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit

class ReportVC: UIViewController, UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var imageReport = UIImage(named: "TelaInicialBG")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = ReportTableViewCell()
        
        switch (indexPath.row){
            
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell
            
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell
            cell.imageReport.image = self.imageReport

        case 2:
             cell = tableView.dequeueReusableCellWithIdentifier(self.returnIdentifier(indexPath.row), forIndexPath: indexPath) as! ReportTableViewCell
        default:
            print("Deu ruim na tableViewReport")
        }//fim switch
    
        return cell
    
    }
    
    
    func returnIdentifier(rowIndex: Int) -> String{
    
        var cellIdentifier = String()
        
        switch (rowIndex){
        case 0:
            cellIdentifier =  "CellContractStatus"
            self.tableView.rowHeight = 50
            
        case 1:
           cellIdentifier = "CellImage"
           self.tableView.rowHeight = 250

            
        case 2:
              cellIdentifier = "CellReport"
              self.tableView.rowHeight = 300

            
        default:
            print("Deu ruim no case do identifier")
        }
        
        return cellIdentifier
        
    }
    
    
    @IBAction func takePicture(sender: AnyObject) {
        
        self.editPicture()
        
    }
    
    
    
    func editPicture(){
        
        //criando AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Foto", message: "Selecione a opção", preferredStyle: .ActionSheet)
        
        //cancelar a ação
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .Cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelAction)
        
        //chama a funcao tirar foto
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Tirar Foto", style: .Default) { action -> Void in
            self.takePicture()
        }
        actionSheetController.addAction(takePictureAction)
        
        //chama funcao escolher da biblioteca
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Escolher da biblioteca", style: .Default) { action -> Void in
            self.chooseLibrary()
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        
    }
    
    
    
    //tirar foto
    func takePicture(){
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            
            imagePicker.sourceType = .Camera;
            imagePicker.delegate = self
            imagePicker.allowsEditing = true //permitir a edição
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //escolher foto da biblioteca
    func chooseLibrary() {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.delegate = self
            imagePicker.allowsEditing = true //permitir a edição
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //seleciona a foto capturada e coloca na image view
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.imageReport = image;
        
        dismissViewControllerAnimated(true, completion: nil)
        
        self.isEdittingProfile()
        self.tableView.reloadData()
        self.view.endEditing(true)
        
    }

    
    func isEdittingProfile(){
        let rightBarButton = UIBarButtonItem(title: "Concluir", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneEditProfile"))
        
        rightBarButton.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    func doneEditProfile(){
        self.view.endEditing(true)
        
    }
    
}
