import ArgumentParser

struct Swifting: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to manage blog post banners",
        subcommands: [Generate.self])
    
    init() { }
}

struct Generate: ParsableCommand {
    
    public static let configuration = CommandConfiguration(abstract: "Generate a blog post banner from the given input")
    
    @Argument(help: "The title of the blog post")
    private var title: String
    
    @Option(name: .shortAndLong, default: nil, help: "The week of the blog post as used in the file name")
    private var week: Int?
    
    @Flag(name: .long, help: "Show extra logging for debugging purposes")
    private var verbose: Bool
    
    func run() throws {
        if verbose {
            let weekDescription = week.map { "and week \($0)" }
            print("Creating a banner for title \"\(title)\" \(weekDescription ?? "")")
        }
    }
}

Swifting.main()

print("Hello, world!")
