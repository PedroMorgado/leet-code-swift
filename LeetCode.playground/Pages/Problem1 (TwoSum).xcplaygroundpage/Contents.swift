/// LeetCode Problem 1: Two Sum
/// https://leetcode.com/problems/two-sum/
///
/// Given an array of integers `nums` and an integer `target`, the goal is to return
/// the indices of the two numbers such that they add up to `target`.
///
/// ✅ It is guaranteed that exactly one valid solution exists.
/// ❌ You may not use the same element twice.
/// 📝 You can return the answer in any order.
///
/// Examples:
///
/// Input: nums = [2, 7, 11, 15], target = 9
/// Output: [0, 1]  // Because nums[0] + nums[1] == 9
///
/// Input: nums = [3, 2, 4], target = 6
/// Output: [1, 2]
///
/// Input: nums = [3, 3], target = 6
/// Output: [0, 1]
///
/// - Parameters:
///   - nums: Array of integers.
///   - target: Integer representing the desired sum of two numbers.
/// - Returns: An array containing the indices of the two numbers that add up to the target.

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

class Test: XCTestCase {
    
    func testExample1() {
        let result = solution1([2, 7, 11, 15], 9)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
    func testExample2() {
        let result = solution2([3, 2, 4], 6)
        XCTAssertTrue(result.contains(1) && result.contains(2), "Expected indices [1, 2]")
    }
    
    func testExample3() {
        let result = solution3([3, 3], 6)
        XCTAssertTrue(result.contains(0) && result.contains(1), "Expected indices [0, 1]")
    }
    
}

// MARK: - Run

Test.defaultTestSuite.run()
