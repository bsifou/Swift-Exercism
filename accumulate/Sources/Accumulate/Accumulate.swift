extension Array {
    func accumulate<T>(_ f: (Element) -> T) -> [T] {
        var r = [T]()
        for x in self  {
            r.append(f(x))
        }
        return r
    }
}

