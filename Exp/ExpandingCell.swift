//
//  ExpandingCell.swift
//  Exp
//
//  Created by Ernest Gaisie on 16/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import Foundation
import UIKit

public let _ExpandingCell_SharedInstance = ExpandingCell()

public class ExpandingCell {
    public var cardCellExpanded: Bool = false
    
    public class var sharedInstance: ExpandingCell
    {
        return _ExpandingCell_SharedInstance
    }
    
    public func cardCellStatus() {
    
        if cardCellExpanded{
            cardCellExpanded = false
        }
        else
        {
            cardCellExpanded = true
        }
    }
    
    public func cardCellExpansion(initialHeight: CGFloat, ExpandingHeight: CGFloat, indexPath: Int, selectedCell:Int) -> CGFloat{
        if cardCellExpanded{
            if indexPath == selectedCell{
                return ExpandingHeight
            }
            else
            {
                return initialHeight
            }
        }
        return initialHeight
    }
    
    public func viewRounding(radius: Int, view: UIView){
        view.layer.cornerRadius = CGFloat(radius)
        if cardCellExpanded {
            view.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
        
}

