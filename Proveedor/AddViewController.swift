//
//  AddViewController.swift
//  Proveedor
//
//  Created by DannyFernando on 26/6/16.
//  Copyright © 2016 Masters. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var empresaLabel: UITextField!
    @IBOutlet weak var rucLabel: UITextField!
    @IBOutlet weak var paisLabel: UITextField!
    @IBOutlet weak var ciudadLabel: UITextField!
    @IBOutlet weak var direccionLabel: UITextField!
    @IBOutlet weak var telefonoLabel: UITextField!
    @IBOutlet weak var celularLabel: UITextField!
    @IBOutlet weak var representanteLabel: UITextField!
    @IBOutlet weak var fechaPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ESCONDER EL TECLADO TOCANDO EN CUALQUIER PARTE DE LA PANTALLA
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddFunctionButton(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(fechaPicker.date)
        print(strDate)
        
        SaveProveedor(empresaLabel.text!, ruc: rucLabel.text!, pais: paisLabel.text!, ciudad: ciudadLabel.text!, direccion: direccionLabel.text!, telefono: telefonoLabel.text!, celular: celularLabel.text!, representante: representanteLabel.text!, fecha: strDate)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
