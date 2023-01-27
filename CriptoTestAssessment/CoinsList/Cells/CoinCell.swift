//
//  CoinCell.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 25.01.2023.
//

import UIKit

final class CoinCell: UITableViewCell {
    
    lazy var label = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //сториборд
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
