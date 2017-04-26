//
//  auditionCell.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 4/26/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

class auditionCell: UITableViewCell
{

    var labels: [String: (Label: UILabel, x: Int, y: Int, width: Int, height: Int)] = [
        "Instrument": (UILabel(), 30, 0, 160, 40),
        "Sax/Range": (UILabel(), 150, 0, 150, 40),
        "Name": (UILabel(), 260, 0, 200, 40),
        "Score": (UILabel(), 500, 0, 50, 40)
    ]
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Add elements as subview to the contentView
        //self.contentView.addSubview(dataLabel)
        for ( _ , value) in labels
        {
            self.contentView.addSubview(value.Label)
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        //Set element sizes
        //dataLabel.frame = CGRect(x: 20, y: 0, width: 70, height: 30)
        
        for (_, val) in labels
        {
            val.Label.frame = CGRect(x: val.x, y: val.y, width: val.width, height: val.height)
        }
    }

}
