//
//  ModellableView.swift
//  KatanaExperiment
//
//  Created by Andrea De Angelis on 03/07/2017.
//  Copyright © 2017 Bending Spoons. All rights reserved.
//

import Foundation
import UIKit

/*protocol ModellableView {
  var model: ViewModel { get set }
}*/

// typealias for interaction callback
public typealias Interaction = () -> ()

open class ModellableView<VM: ViewModel>: UIView {
  
 open var model: VM = VM() {
    didSet {
      self.update(model: self.model, oldModel: oldValue)
    }
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
    self.style()
  }
  
  open func setup() {}
  
  open func style() {}
  
  /// do not call this method, set self.model variable instead
  open func update(model: VM, oldModel: VM) {}
  
  /// do not call this method, use .setNeedsLayout() instead
  open func layout(model: VM) {}
  
  open override func layoutSubviews() {
    self.layout(model: self.model)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
