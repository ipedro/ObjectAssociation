//
//  ObjectAssociation.swift
//
//  Created by Wojciech Nagrodzki on 27.03.17.
//  https://stackoverflow.com/a/43056053
//

import Foundation

/// A helper class to enable stored properties in Swift extensions.

public final class ObjectAssociation<Object: AnyObject> {

    private let policy: objc_AssociationPolicy

    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {

        self.policy = policy
    }

    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> Object? {
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as? Object }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}
