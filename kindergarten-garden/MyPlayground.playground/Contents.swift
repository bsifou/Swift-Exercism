import Foundation



var r = """
        Alice, Bob, Charlie, David,
        Eve, Fred, Ginny, Harriet,
        Ileana, Joseph, Kincaid, and Larry
        """
    .split(separator: "\n")
    .flatMap({ $0.split(separator: ",") })
    .map({ String($0.trimmingCharacters(in: .whitespaces)) })

print(r.sorted())
print(r.sorted().firstIndex(of: "Alice"))
