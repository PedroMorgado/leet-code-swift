/// LeetCode Problem 2: Add Two Numbers
/// https://leetcode.com/problems/add-two-numbers/
///
/// You are given two non-empty linked lists representing two non-negative integers.
/// The digits are stored in reverse order, and each of their nodes contains a single digit.
/// Add the two numbers and return the sum as a linked list.
///
/// ✅ It is guaranteed that the list represents a number with no leading zeros (except the number 0 itself).
/// 📝 The input lists represent the numbers in reverse order.
/// ❌ The input lists cannot be empty.
///
/// Examples:
///
/// Input: l1 = [2, 4, 3], l2 = [5, 6, 4]
/// Output: [7, 0, 8]
/// Explanation: 342 + 465 = 807
///
/// Input: l1 = [0], l2 = [0]
/// Output: [0]
///
/// Input: l1 = [9, 9, 9, 9, 9, 9, 9], l2 = [9, 9, 9, 9]
/// Output: [8, 9, 9, 9, 0, 0, 0, 1]
///
/// - Parameters:
///   - l1: First non-empty linked list representing a non-negative integer.
///   - l2: Second non-empty linked list representing a non-negative integer.
/// - Returns: A linked list representing the sum of the two numbers.
///
/// - Constraints:
///   - The number of nodes in each linked list is in the range [1, 100].
///   - 0 <= Node.val <= 9
///   - The input lists do not contain leading zeros, except for the number 0 itself.

import Foundation
import XCTest

// MARK: - Definition

class ListNode {
    
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

// MARK: - Solution

func solution1(_ l1: ListNode, _ l2: ListNode) -> ListNode? {
    return ListNode()
}

// MARK: - Test

class TestSolution1: XCTestCase {
    
    func test1() {
        let l1 = ListNode(2, ListNode(4, ListNode(3)))
        let l2 = ListNode(5, ListNode(6, ListNode(4)))
        let result = solution1(l1, l2)
        XCTAssertEqual(linkedListToArray(result), [7, 0, 8], "Expected [7, 0, 8]")
    }
    
    func test2() {
        let l1 = ListNode(0)
        let l2 = ListNode(0)
        let result = solution1(l1, l2)
        XCTAssertEqual(linkedListToArray(result), [0], "Expected [0]")
    }
    
    func test3() {
        let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let l2 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))
        let result = solution1(l1, l2)
        XCTAssertEqual(linkedListToArray(result), [8,9,9,9,0,0,0,1], "Expected [8,9,9,9,0,0,0,1]")
    }
}

func linkedListToArray(_ node: ListNode?) -> [Int] {
    var result: [Int] = []
    var current = node
    while let n = current {
        result.append(n.val)
        current = n.next
    }
    return result
}

// MARK: - Run

TestSolution1.defaultTestSuite.run()
