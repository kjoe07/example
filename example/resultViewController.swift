//
//  resultViewController.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/15/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import UIKit

class resultViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var data: productResponse?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        self.title = "Resultados"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (data?.data!.count)! - 3 {
            self.loadData()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! productTableViewCell
        cell.setup(with: data!.data![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    func addBotton(){
        let button = UIButton(frame: CGRect(x: tableview.frame.maxX - 60, y: tableview.frame.maxY - 60, width: 42, height: 42))
        button.addTarget(self, action: #selector(self.scrolltoTop), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "F062"), for: .normal)
        button.tag = 1000
        self.view.addSubview(button)
    }
    @objc func scrolltoTop(){
        self.tableview.scrollsToTop = true
        self.tableview.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 420{
            if view.viewWithTag(1000) == nil{
                addBotton()
            }
        }else{
            if let view = view.viewWithTag(1000){
                view.removeFromSuperview()
            }
        }
    }
    func loadData(){
        let dataLoader = requestManager()
        guard let urlString = data!.next_page_url else {return}
        dataLoader.request(params: .string(string: urlString), then: {[weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let data):
                self.parseData(with: data)
            case .failure(let error):
                print("error \(error)")
            }
        })
    }
    func parseData(with: Data){
        let myData = try! JSONDecoder().decode(productResponse.self, from: with)
        guard let newData = myData.data else {return}
       // let row = self.data!.data!.count
        self.data?.current_page = myData.current_page
        self.data?.data?.append(contentsOf: newData)
        self.data?.from = myData.from
        self.data?.next_page_url = myData.next_page_url
        self.data?.prev_page_url = myData.prev_page_url
        self.data?.to = myData.to
        self.data?.total = myData.total
//        let indexPaths = (row - 1 ..< self.data!.data!.count).map { IndexPath(row: $0, section: 0) }
        DispatchQueue.main.async {
            self.tableview.reloadData()
           // for i  in 1...newData.count{
           // self.tableview.beginUpdates()
          //  self.tableview.insertRows(at: indexPaths, with: .automatic)
            //self.tableview.endUpdates()
            //}
            
        }
        //self.data?.data?.append(myData.data)
    }
}
