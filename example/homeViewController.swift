//
//  homeViewController.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/7/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    var isHidden = true
    @IBOutlet weak var searchButton: searchButton!
    @IBOutlet weak var searchTextField: UITextField!
    var mydata: productResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1.6, repeats: true) {_ in
            self.popViewOutOfButton()
        }
        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            let vc = segue.destination as! resultViewController
            vc.data = self.mydata            
        }
    }
 
    func popViewOutOfButton() {
        let halo = UIView(frame: searchButton.frame)
        halo.layer.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        view.addSubview(halo)
        halo.layer.cornerRadius = halo.frame.height / 2//rounded()
        halo.layer.opacity = 0.3
        halo.isUserInteractionEnabled = false
        searchButton.layer.zPosition = 1
        searchButton.setImage(#imageLiteral(resourceName: "F021"), for: .normal)
        searchButton.tintColor = .white
        UIView.animate(withDuration: 6, delay: 0, options: [.curveEaseOut], animations: {
            halo.layer.opacity = 0
            halo.transform = CGAffineTransform(scaleX: 4, y: 4).rotated(by: 6.28319)//
        }, completion: { _ in
            halo.removeFromSuperview()
        })
    }
    
    @IBAction func searchProduct(_ sender: UIButton){
        if searchTextField.text != ""{
            self.view.endEditing(true)
            self.searchTextField.resignFirstResponder()
            self.searchButton.rotate()
            let myQuery = queryBuilder(text: searchTextField.text!)
            let end = myQuery.mypostEndpoint(path: "/api/product/text-search")
            let dat = dataLoader()
            let post =  postLoader()
            dat.loadData(params: parameters.Endpoint(endpoint: end), completion:{ (result<T:productResponse>) in
                switch result{
                case .datos(let Dato):
                    self.mydata = Dato as? productResponse
                    self.stopanAnimation()
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "showResult", sender: self)
                    }
                case .error(let error):
                    self.stopanAnimation()
                }
            })
//            dat.loadData<productResponse>(params: parameters.Endpoint(endpoint: end), completion:{ result in
//                switch result{
//                case .datos(let Dato):
//                    self.mydata = Dato as? productResponse
//                    self.stopanAnimation()
//                    DispatchQueue.main.async {
//                        self.performSegue(withIdentifier: "showResult", sender: self)
//                    }
//                case .error(let error):
//                    self.stopanAnimation()
//                }
//            })
        }else{
            let image = UIImageView(image: #imageLiteral(resourceName: "F071"))
            image.tintColor =  #colorLiteral(red: 0.7921568627, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
            searchTextField.rightView = image
            searchTextField.rightViewMode = .always
        }
    }
    
    func stopanAnimation(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.5, animations: {
                self.searchButton.transform = .identity
            })
        }
    }
}
