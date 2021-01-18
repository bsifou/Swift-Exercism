enum CircularBufferError: Error {
    case bufferFull, bufferEmpty
    
}

struct CircularBuffer<T>  {
    var capacity: Int
    var buffer: [T?] = []
   
    mutating func read() throws ->  T  {
        guard !isEmpty else {
            throw CircularBufferError.bufferEmpty
        }
        
        return buffer.removeFirst()!
    }
    
    mutating func clear() {
        buffer = []
    }
    
    mutating func overwrite(_ x: T) {
        if isFull {
            buffer.removeFirst()
            buffer.append(x)
        } else {
            buffer.append(x)
        }
    }
    
    mutating func write(_ x: T) throws {
        guard !isFull else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(x)
        
    }
}

extension CircularBuffer {
    var isFull: Bool {
        buffer.count >= capacity
    }
    
    var isEmpty: Bool {
        buffer.isEmpty
    }
}


