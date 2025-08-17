//
//  ProductDetailsVC.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 16/08/25.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    var viewModel : ProductDetailsModelView?

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var disLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDetilas()
      
    }

    func setDetilas(){
        guard let data = viewModel else{ return}
        image.setImage(with: data.image)
        titleLab.text = data.title
        subtitle.text = data.category
        ratingBtn.setTitle(data.rating, for: .normal)
        priceLab.text = data.price
        
    
    }
}
