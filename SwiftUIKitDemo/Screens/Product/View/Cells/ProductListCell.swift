//
//  ProductListCell.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import UIKit


class ProductListCell: UITableViewCell {
    @IBOutlet weak var productBacgroundView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productSubTitle: UILabel!
    @IBOutlet weak var productDis: UILabel!
    @IBOutlet weak var rating: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    
    var product:Prodouct?{
        didSet{
            productDetailsConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBacgroundView.roundAllCorners(radius: 12)
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfig(){
        guard let product else{return}
        productTitle.text = product.title
        productSubTitle.text = product.category
        productDis.text = product.description
        productPrice.text = "\(product.price) Rs"
        rating.setTitle("\(product.rating.rate)", for: .normal)
        productImage.setImage(with: product.image)
    }
    
}
