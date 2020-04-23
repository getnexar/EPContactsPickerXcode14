//
//  EPExtensions.swift
//  EPContactPicker
//
//  Created by Prabaharan Elangovan on 14/10/15.
//  Copyright © 2015 Prabaharan Elangovan. All rights reserved.
//

import UIKit
import Foundation

extension String {
  subscript(r: Range<Int>) -> String? {
    get {
      let stringCount = self.count as Int
      if (stringCount < r.upperBound) || (stringCount < r.lowerBound) {
        return nil
      }
      let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
      let endIndex = self.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
      return String(self[(startIndex ..< endIndex)])
    }
  }
  
  func containsAlphabets() -> Bool {
    //Checks if all the characters inside the string are alphabets
    let set = CharacterSet.letters
    return self.utf16.contains( where: {
      guard let unicode = UnicodeScalar($0) else { return false }
      return set.contains(unicode)
    })
  }
}

public extension UIView {
  public func addSubviewAutoLayoutFill(_ view: UIView) {
    self.addSubview(view)
    self.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal,
                                          toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
    self.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal,
                                          toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
    self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                          toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
    self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                          toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
  }
}

extension UITextField {
  func setLeftPaddingPoints(_ amount: CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
  }
  func setRightPaddingPoints(_ amount: CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
  }
}
