//
//  Bindable.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class Bindable<T> {
    
    var value: T? {
        didSet  {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    
    func bind(observer:@escaping (T?) -> ()) {
        self.observer = observer
    }
}
