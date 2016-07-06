//
//  EditarController.swift
//  Proveedor
//
//  Created by DannyFernando on 4/7/16.
//  Copyright © 2016 Masters. All rights reserved.
//

import UIKit

class EditarViewController: UIViewController {
    
    
    @IBOutlet weak var empresaLabel: UITextField!
    @IBOutlet weak var rucLabel: UITextField!
    @IBOutlet weak var paisLabel: UITextField!
    @IBOutlet weak var ciudadLabel: UITextField!
    @IBOutlet weak var direccionLabel: UITextField!
    @IBOutlet weak var telefonoLabel: UITextField!
    @IBOutlet weak var celularLabel: UITextField!
    @IBOutlet weak var representanteLabel: UITextField!
    @IBOutlet weak var fechaPicker: UIDatePicker!
    
    var objetoRecibido = Proveedor.init(empresa: "", celular: "", ciudad: "", direccion: "", fecha: "", pais: "", representante: "", ruc: "", telefono: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        empresaLabel.text = objetoRecibido.empresa
        rucLabel.text = objetoRecibido.ruc
        paisLabel.text = objetoRecibido.pais
        ciudadLabel.text = objetoRecibido.ciudad
        direccionLabel.text = objetoRecibido.direccion
        telefonoLabel.text = objetoRecibido.telefono
        celularLabel.text = objetoRecibido.celular
        representanteLabel.text = objetoRecibido.representante
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
        
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}