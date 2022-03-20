//
//  LoadingTableViewCell.swift
//  NYCSchools
//
//  Created by Shraboni on 3/18/22.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "loading_cell"
    private let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addAutoLayoutSubview(spinner)

        NSLayoutConstraint.activate(
            [
                contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: spinner.topAnchor),
                contentView.centerXAnchor.constraint(equalTo: spinner.centerXAnchor),
                contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: spinner.bottomAnchor)
            ]
        )

        spinner.startAnimating()
        spinner.hidesWhenStopped = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init from coder not implemented")
    }
}
