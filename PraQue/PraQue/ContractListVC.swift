//
//  ContractListVC.swift
//  PraQue
//
//  Created by Ludimila da Bela Cruz on 4/10/16.
//  Copyright © 2016 Ludimila da Bela Cruz. All rights reserved.
//

import UIKit
import MapKit

class ContractListVC: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var map: MKMapView!
    
    // Array de testes
   static var convenios = [
        [
            "NM_PROGRAMA":"Resíduos Sólidos Urbanos",
            "TX_OBJETO_CONVENIO":"Ampliação do Barracão de Coleta Seletiva de Lixo do Municipio de Paranavaí"
        ],
        [
            "NM_PROGRAMA":"Turismo Social no Brasil: Uma Viagem de Inclusão - Convênios",
            "TX_OBJETO_CONVENIO":"Empreitada global para reforma e recuperação das Igrejas em estilo Gótico do Interior do Municipio de Sananduva"
        ],
        [
            "NM_PROGRAMA":"FOMENTO AO DESENVOLVIMENTO TURÍSTICO LOCAL  EMENDAS",
            "TX_OBJETO_CONVENIO":"1º Encontro Nacional de Radiomadores - DF"
        ]
    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        self.map.showsUserLocation = true;
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContractListVC.convenios.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContractTableViewCell
        
        cell.contractName.text = ContractListVC.convenios[indexPath.row]["NM_PROGRAMA"]
        
        return cell
    }
    

}
