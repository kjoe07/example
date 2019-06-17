//
//  productTableViewCell.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import UIKit

class productTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var um: UILabel!
    @IBOutlet weak var dispo: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var product: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       // contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
        containerView.layer.backgroundColor = UIColor(named: "lightblue")!.cgColor
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 12
        containerView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(with datos: Producto){
        name.text = datos.nombre ?? ""
        print("datos name \(String(describing: datos.nombre))")
        um.text = datos.unidad_medida ?? ""
        dispo.text = datos.disponibilidad ?? ""
        price.text = "$" + datos.precio!//String(format: "$%.02f", datos.precio!)
        //        let formater = NumberFormatter()
//        formater.locale = Calendar.current.locale
//        formater.numberStyle = .currency
//        let priceValue =  Double(datos.precio!)
//        if let priceText = formater.string(from: NSNumber(value: priceValue!)){
//            print(priceText)
//            price.text = priceText
//        }else{
//            print("error al texto")
//        }
//        price.text = datos.precio ?? ""
//        guard let disponi = Int(datos.disponibilidad!) else {return}
//        if disponi < 10 {
//            dispo.textColor = #colorLiteral(red: 0.7921568627, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
//        }
    }

}
