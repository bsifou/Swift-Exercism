enum CircularBufferError: Error {
    case bufferFull, bufferEmpty
    
}

struct CircularBuffer<T>  {
    var capacity: Int
    var buffer: [T?]
    var oldest = 0
    var newest = 0
    
    init(capacity: Int) {
        self.capacity = capacity
        self.buffer = Array(repeating: nil, count: capacity)
    }
    
    mutating func read() throws ->  T  {
        guard  abs(newest - oldest) > 0 else {
            throw CircularBufferError.bufferEmpty
        }
        let oldest1 = buffer[oldest]!
        oldest = (oldest + 1) % capacity
        return oldest1
    }
    
    mutating func clear() {
        oldest = 0
        newest = 0
    }
    
    mutating func overwrite(_ x: T) {
        //        if buffer.count > buffer.capacity  {
        //            buffer.removeFirst()
        //        }
        //
        //        buffer.append(x)
        
        buffer.insert(x, at: oldest)
        
    }
    
    mutating func write(_ x: T) throws {
        guard abs(newest - oldest) < capacity - 1 else {
            throw CircularBufferError.bufferFull
        }
        print("XXXXXX")
        buffer[newest] = x
        newest = (newest + 1) % capacity
        
    }
}
