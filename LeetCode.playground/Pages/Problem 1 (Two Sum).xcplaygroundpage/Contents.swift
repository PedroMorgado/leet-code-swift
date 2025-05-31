/// LeetCode Problem 1: Two Sum
/// https://leetcode.com/problems/two-sum/
///
/// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
///
/// ✅ It is guaranteed that exactly one valid solution exists.
/// ❌ You may not use the same element twice.
/// 📝 You can return the answer in any order.
///
/// Examples:
///
/// Input: nums = [2, 7, 11, 15], target = 9
/// Output: [0, 1]
/// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
///
/// Input: nums = [3, 2, 4], target = 6
/// Output: [1, 2]
///
/// Input: nums = [3, 3], target = 6
/// Output: [0, 1]
///
/// - Parameters:
///   - nums: An array of integers.
///   - target: Integer representing the target sum.
/// - Returns: An array containing the indices of the two numbers that add up to the target.
///
/// - Constraints:
///   - 2 <= nums.length <= 10⁴
///   - -10⁹ <= nums[i] <= 10⁹
///   - -10⁹ <= target <= 10⁹
///   - Only one valid answer exists.

import Foundation
import XCTest

// MARK: - Solution

func solution1(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int] = []
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                result = [i, j]
                break
            }
        }
    }
    return result
}

func solution2(_ nums: [Int], _ target: Int) -> [Int] {
    var numToIndex: [Int: Int] = [:]
    
    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let j = numToIndex[complement] {
            return [j, i]
        }
        numToIndex[num] = i
    }
    
    return []
}

func solution3(_ nums: [Int], _ target: Int) -> [Int] {
    let sortedNums = nums.sorted()
    var left = 0
    var right = nums.count - 1

    while left < right {
        let sum = sortedNums[left] + sortedNums[right]
        if sum == target {
            if let index1 = nums.firstIndex(of: sortedNums[left]),
               let index2 = nums.lastIndex(of: sortedNums[right]) {
            return [index1, index2]
            }
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }

    return []
}

// MARK: - Test

class TestSolution1: XCTestCase {
    
    func test1() {
        let result = solution1([2, 7, 11, 15], 9)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
    func test2() {
        let result = solution1([3, 2, 4], 6)
        XCTAssertTrue(result.contains(1) && result.contains(2), "Expected indices [1, 2]")
    }
    
    func test3() {
        let result = solution1([3, 3], 6)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
}

class TestSolution2: XCTestCase {
    
    func test1() {
        let result = solution2([2, 7, 11, 15], 9)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
    func test2() {
        let result = solution2([3, 2, 4], 6)
        XCTAssertTrue(result.contains(1) && result.contains(2), "Expected indices [1, 2]")
    }
    
    func test3() {
        let result = solution2([3, 3], 6)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
}

class TestSolution3: XCTestCase {
    
    func test1() {
        let result = solution3([2, 7, 11, 15], 9)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
    func test2() {
        let result = solution3([3, 2, 4], 6)
        XCTAssertTrue(result.contains(1) && result.contains(2), "Expected indices [1, 2]")
    }
    
    func test3() {
        let result = solution3([3, 3], 6)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
}

// MARK: - Run

TestSolution1.defaultTestSuite.run()
TestSolution2.defaultTestSuite.run()
TestSolution3.defaultTestSuite.run()
