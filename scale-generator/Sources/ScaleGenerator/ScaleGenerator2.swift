extension String {
  func tonicify() -> String {
    if self.count == 2 {
      return self.prefix(1).uppercased() + self.suffix(1)
    }

    return self.uppercased()
  }
}
