//
//  TableViewController.swift
//  Proveedor
//
//  Created by DannyFernando on 26/6/16.
//  Copyright © 2016 Masters. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var listaProveedores = [Proveedor]()
    @IBOutlet var provedorTableView: UITableView!
    var objetoProveedor = Proveedor.init(empresa: "", celular: "", ciudad: "", direccion: "", fecha: "", pais: "", representante: "", ruc: "", telefono: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaProveedores = LeerProveedores() as! [Proveedor]
        self.provedorTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaProveedores.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = provedorTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + listaProveedores[indexPath.row].empresa
        cell.detailTextLabel?.text = "\nRepresentante: " +  listaProveedores[indexPath.row].representante + "\nRUC: " +  listaProveedores[indexPath.row].ruc + "\nPais: " + listaProveedores[indexPath.row].pais + "\nCiudad: " + listaProveedores[indexPath.row].ciudad + "\nTelefono: " + listaProveedores[indexPath.row].telefono + "\nCelular: " + listaProveedores[indexPath.row].celular + "\nDirección: " + listaProveedores[indexPath.row].direccion + "\nFecha de constitución: " + listaProveedores[indexPath.row].fecha
        
        return cell
    }
    
    @IBAction func ActualizarDatos(sender: AnyObject) {
        self.listaProveedores.removeAll()
        self.listaProveedores = LeerProveedores() as! [Proveedor]
        self.provedorTableView.reloadData()
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let accionEditar = UITableViewRowAction(style: .Normal, title: "Editar") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
           self.performSegueWithIdentifier("editarView", sender: self)
            self.objetoProveedor.empresa = self.listaProveedores[indexPath.row].empresa
            self.objetoProveedor.celular = self.listaProveedores[indexPath.row].celular
            self.objetoProveedor.ciudad = self.listaProveedores[indexPath.row].ciudad
            self.objetoProveedor.direccion = self.listaProveedores[indexPath.row].direccion
            self.objetoProveedor.fecha = self.listaProveedores[indexPath.row].fecha
            self.objetoProveedor.pais = self.listaProveedores[indexPath.row].pais
            self.objetoProveedor.representante = self.listaProveedores[indexPath.row].representante
            self.objetoProveedor.ruc = self.listaProveedores[indexPath.row].ruc
            self.objetoProveedor.telefono = self.listaProveedores[indexPath.row].telefono
            
            
        }
        let accionEliminar = UITableViewRowAction(style: .Normal, title: "Eliminar") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            EliminarProveedor(self.listaProveedores[indexPath.row].empresa)
            self.listaProveedores.removeAll()
            self.listaProveedores = LeerProveedores() as! [Proveedor]
            self.provedorTableView.reloadData()
        }
        
        accionEditar.backgroundColor = UIColor.blueColor()
        accionEliminar.backgroundColor = UIColor.redColor()
        return [accionEditar, accionEliminar]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "editarView") {
            let DestViewController: EditarViewController = segue.destinationViewController as! EditarViewController
            DestViewController.objetoRecibido = self.objetoProveedor
        }
    }
    
    
    
    
    
    
}
