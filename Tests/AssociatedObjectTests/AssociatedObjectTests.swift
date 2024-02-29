import XCTest
@testable import AssociatedObject

extension NSString: Associatedable {
    
}

class NSStringAssociatedObject: NSObject, AssociatedObject {
    static var associatedKey: Void?
    var weakRawValue: NSString?
}

final class AssociatedObjectTests: XCTestCase {
    func testExample() throws {
        let str = NSString()
        let o0 = str.associatedObject(of: NSStringAssociatedObject.self)
        let o1 = str.nullableAssociatedObject(of: NSStringAssociatedObject.self)
        XCTAssertEqual(o0, o1)
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
