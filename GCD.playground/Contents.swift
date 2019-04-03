import UIKit
import Foundation
/*
 // Dispatch Semaphore example
 let higherPriority = DispatchQueue.global(qos: .userInitiated)
 let lowerPriority = DispatchQueue.global(qos: .utility)
 let firstExecution = DispatchQueue.global(qos: .userInteractive)
 let secondExecution = DispatchQueue.global(qos: .userInteractive)
 let thirdExecution = DispatchQueue.global(qos: .userInteractive)
 let fourExecution = DispatchQueue.global(qos: .userInteractive)

 let semaphore = DispatchSemaphore(value: 2)

 func asyncPrint(queue: DispatchQueue, symbol: String) {
 queue.async {
 semaphore.wait()
 for i in 0...10 {
 print(symbol, i)
 }
 semaphore.signal()
 }
 }

 //asyncPrint(queue: higherPriority, symbol: "🔴")
 //asyncPrint(queue: lowerPriority, symbol: "🔵")
 asyncPrint(queue: firstExecution, symbol: "🔴")
 asyncPrint(queue: secondExecution, symbol: "🔵")
 asyncPrint(queue: thirdExecution, symbol: "🐨")
 asyncPrint(queue: fourExecution, symbol: "💖")
 */
// Sync versus Async
let myQueueWithSync = DispatchQueue(label: "myQueueWithSync")
myQueueWithSync.sync {
    for i in 0...10 {
        print("🔴 \(i)")
    }
}
for i in 100...110 {
    print("🔵 \(i)")
}

myQueueWithSync.async {
    for i in 0...10 {
        print("🔴 \(i)")
    }
}
for i in 100...110 {
    print("🔵 \(i)")
}
