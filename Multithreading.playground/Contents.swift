import UIKit
import Foundation

// GCD - Grand Central Dispatch 

// Queues
DispatchQueue

// Main serial queue
DispatchQueue.main
 
// Global concurrent queues
DispatchQueue.global(qos: .userInitiated)

// Quality of service
DispatchQoS.userInteractive
DispatchQoS.userInitiated
DispatchQoS.background
DispatchQoS.utility

// Sync
DispatchQueue.global(qos: .background).sync {
    print(1)
}
print(2)

// Async
DispatchQueue.global(qos: .background).async {
    print(1)
}
print(2)

// Locking, Readers, Writers etc.

// Operations
OperationQueue
Operation
