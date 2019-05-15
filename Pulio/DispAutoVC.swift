//
//  DispAutoVC.swift
//  Pulio
//
//  Created by Diego Perez on 5/12/19.
//  Copyright © 2019 DiegoCodes. All rights reserved.
//

import UIKit

class DispAutoVC: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    let capacidad = ["Capacidad","1","2","3","4","5"]
    let anio = ["Año","2019",
                "2018",
                "2017",
                "2016",
                "2015",
                "2014",
                "2013",
                "2012",
                "2011",
                "2010",
                "2009",
                "2008",
                "2007",
                "2006",
                "2005",
                "2004",
                "2003",
                "2002",
                "2001",
                "2000",
                ]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0){
            return capacidad[row]
        }else{
            return anio[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0){
            return capacidad.count
        }else{
            return anio.count
        }
    }
    
    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 16;
        popupView.layer.masksToBounds = true;
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
