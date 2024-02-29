import Foundation
// add a runtime associated object referring this instance
public protocol Associatedable: NSObject {
}
public extension Associatedable {
    func associatedObject<T: AssociatedObject>(of type: T.Type) -> T where Self == T.T {
        if let object = nullableAssociatedObject(of: type) {
            return object
        }
        let object = T.init(weakRawValue: self)
        objc_setAssociatedObject(self, type.key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return object
    }
    func nullableAssociatedObject<T: AssociatedObject>(of type: T.Type) -> T? where Self == T.T {
        return objc_getAssociatedObject(self, type.key) as? T
    }
}
public protocol AssociatedObject: NSObject {
    associatedtype T where T: NSObject
    static var associatedKey: Void? {set get}
    var weakRawValue: T? {get set}
}
extension AssociatedObject {
    static var key: UnsafeRawPointer {withUnsafePointer(to: &associatedKey) {UnsafeRawPointer($0)}}
    init(weakRawValue: T) {
        self.init()
        self.weakRawValue = weakRawValue
    }
}
