//
//  ModeloProveedor.swift
//  Proveedor
//
//  Created by DannyFernando on 26/6/16.
//  Copyright © 2016 Masters. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Proveedor {
    var empresa : String
    var celular: String
    var ciudad: String
    var direccion: String
    var fecha: String
    var pais: String
    var representante: String
    var ruc: String
    var telefono: String
    
    init(empresa: String, celular: String, ciudad: String, direccion: String, fecha: String, pais: String, representante: String, ruc: String, telefono: String){
        self.empresa = empresa
        self.celular = celular
        self.ciudad = ciudad
        self.direccion = direccion
        self.fecha = fecha
        self.pais = pais
        self.representante = representante
        self.ruc = ruc
        self.telefono = telefono
    }
}

func SaveProveedor(empresa: String, ruc: String, pais: String, ciudad: String, direccion: String, telefono: String, celular: String, representante: String, fecha: String) {
    
    let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context: NSManagedObjectContext = appDel.managedObjectContext
    
    let newTarifa = NSEntityDescription.insertNewObjectForEntityForName("Proveedor", inManagedObjectContext: context)
    newTarifa.setValue(empresa, forKey: "empresa")
    newTarifa.setValue(ruc, forKey: "ruc")
    newTarifa.setValue(pais, forKey: "pais")
    newTarifa.setValue(ciudad, forKey: "ciudad")
    newTarifa.setValue(ciudad, forKey: "direccion")
    newTarifa.setValue(telefono, forKey: "telefono")
    newTarifa.setValue(celular, forKey: "celular")
    newTarifa.setValue(representante, forKey: "representante")
    newTarifa.setValue(fecha, forKey: "fecha")
    do{
        try context.save()
        NSLog("Proveedor: Guardado correctamente")
    }catch{
        NSLog("Proveedor: No se pudo guardar el proveedor problema en el try")
        
    }
}

func LeerProveedores()-> NSArray{
    var lista = [Proveedor]()
    let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context: NSManagedObjectContext = appDel.managedObjectContext
    
    do{
        let peticion = NSFetchRequest(entityName: "Proveedor")
        let resultado = try context.executeFetchRequest(peticion)
        
        if resultado.count > 0 {
            for item in resultado as! [NSManagedObject]{
                let prove = Proveedor.init(empresa: "", celular: "", ciudad: "", direccion: "", fecha: "", pais: "", representante: "", ruc: "", telefono: "")
                prove.empresa = item.valueForKey("empresa") as! String
                prove.ruc = item.valueForKey("ruc") as! String
                prove.pais = item.valueForKey("pais") as! String
                prove.ciudad = item.valueForKey("ciudad") as! String
                prove.direccion = item.valueForKey("direccion") as! String
                prove.telefono = item.valueForKey("telefono") as! String
                prove.celular = item.valueForKey("celular") as! String
                prove.representante = item.valueForKey("representante") as! String
                prove.fecha = item.valueForKey("fecha") as! String
                
                lista.append(prove)
                NSLog("Proveedor: \(item)")
            }
            NSLog("Proveedor: Se leyeron los datos")
        }else{
            NSLog("Proveedor: No hay datos en la base")
        }
    }catch{
        NSLog("Proveedor: No se pudo leer los datos")
    }
    return lista
}

func EliminarProveedor(empresa: String) {
    let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context: NSManagedObjectContext = appDel.managedObjectContext
    
    let predicate = NSPredicate(format: "empresa == %@", empresa)
    
    let fetchRequest = NSFetchRequest(entityName: "Proveedor")
    fetchRequest.predicate = predicate
    
    do {
        let fetchedEntitie = try context.executeFetchRequest(fetchRequest)
        if let entityToDelete = fetchedEntitie.first {
            context.deleteObject(entityToDelete as! NSManagedObject)
        }
    } catch {
        // Do something in response to error condition
    }
    
    do {
        try context.save()
    } catch {
        // Do something in response to error condition
    }
}
