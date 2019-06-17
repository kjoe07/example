//
//  producto.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
struct Producto : Codable {
    let id : Int?
    let imagen : String?
    let cod_barra : String?
    let nombre : String?
    let departamento_id : String?
    let departamento : String?
    let precio : String?
    let unidad_medida : String?
    let disponibilidad : String?
    
    enum CodingKeys: String, CodingKey {        
        case id = "id"
        case imagen = "imagen"
        case cod_barra = "cod_barra"
        case nombre = "nombre"
        case departamento_id = "departamento_id"
        case departamento = "departamento"
        case precio = "precio"
        case unidad_medida = "unidad_medida"
        case disponibilidad = "disponibilidad"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imagen = try values.decodeIfPresent(String.self, forKey: .imagen)
        cod_barra = try values.decodeIfPresent(String.self, forKey: .cod_barra)
        nombre = try values.decodeIfPresent(String.self, forKey: .nombre)
        departamento_id = try values.decodeIfPresent(String.self, forKey: .departamento_id)
        departamento = try values.decodeIfPresent(String.self, forKey: .departamento)
        precio = try values.decodeIfPresent(String.self, forKey: .precio)
        unidad_medida = try values.decodeIfPresent(String.self, forKey: .unidad_medida)
        disponibilidad = try values.decodeIfPresent(String.self, forKey: .disponibilidad)
    }
    
}
