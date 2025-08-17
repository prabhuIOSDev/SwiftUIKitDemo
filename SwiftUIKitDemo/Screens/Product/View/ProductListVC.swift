//
//  ProductListVC.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import UIKit

class ProductListVC: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configaration()
    }

}

extension ProductListVC{
    
    func configaration(){
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(UINib(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        initViewModel()
        observeEvent()
        
    }
    
    func initViewModel(){
        viewModel.fetchProductDataApi()
    }
    
    // data binding event observed - communication ...
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            switch event {
            case .loading:break
            case .stopLoading:break
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error as Any)
                
            }
            
            
        }
    }
    
}

extension ProductListVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as? ProductListCell else {
                return UITableViewCell()
            
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedIndex = viewModel.products[indexPath.row]
        let detail = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
        detail.viewModel = ProductDetailsModelView(product: selectedIndex)
        navigationController?.pushViewController(detail, animated: true)
        

        
    }
}

