//
//  ViewController.swift
//  Api-nested-BindData-in -Nested-view
//
//  Created by Mac on 19/05/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    open var products:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
    }

    func fetchData() {
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        
        URLSession.shared.dataTask(with: url) {
            data,response,error in
            
            guard let okData = data else {return}
            
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: okData)
                self.products = apiResponse.products
                print(self.products.count)
                
            }
            catch {
                print("Errors Occur")
            }
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }.resume()
    }
    
    
    
}


extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: "TableViewCellProduct", for: indexPath) as? TableViewCellProduct else {return UITableViewCell()}
        cell.idLabel.text = products[indexPath.row].id.description
        cell.titleLabel.text = products[indexPath.row].title
        cell.descriptionLabel.text = products[indexPath.row].description
        let imagesBind = URL(string: products[indexPath.row].thumbnail)
        cell.imagess.kf.setImage(with: imagesBind)
        cell.products = products[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Image and Description "
        
    }
}
