import Foundation
func getTranslations() -> [String: String] {
    let rawTranslations =
        """
        AUG    Methionine
        UUU, UUC    Phenylalanine
        UUA, UUG    Leucine
        UCU, UCC, UCA, UCG    Serine
        UAU, UAC    Tyrosine
        UGU, UGC    Cysteine
        UGG    Tryptophan
        UAA, UAG, UGA    STOP
        """
    
    return rawTranslations
        .split(separator: "\n").map({ $0.split(whereSeparator: { $0 == " " || $0 == ","}) })
        .reduce([:]) { mapping, line in
            var mapping = mapping
            let protein = String(line.last!)
            line.dropLast().forEach { x in
                mapping[String(x)] = protein
            }
            return mapping
        }
}


extension String {
    var codons: [String] {
        var rna = self
        var arrayOfCodons : [String] = []
        while !rna.isEmpty {
            arrayOfCodons.append(String(rna.prefix(3)))
            rna = String(rna.dropFirst(3))
        }
        
        return arrayOfCodons
    }
}

enum ProteinTranslationError: Error {
    case invalidCodon
}


struct ProteinTranslation {
    
    private static let translations = getTranslations()
    
    
    static func translationOfCodon(_ codon: String) throws -> String {
        guard let codon = translations[codon] else  {
            throw ProteinTranslationError.invalidCodon
        }
        return codon
    }
    
    static func translationOfRNA(_ rna: String) throws -> [String] {
        var proteins: [String] = []
        for c in rna.codons  {
            let protein = try! translationOfCodon(c)
            if (protein == "STOP") {
                break
            }
            proteins.append(protein)
        }
        return proteins
    }
}

var t: Int = 0
var toPrint = stride(from: 0, to: 10, by: 1).reduce([]) {r, i in
     r + [1]
}
print(toPrint)


// print(ProteinTranslation.translationOfCodon("CAR"))

// print(ProteinTranslation.translationOfRNA("CARROT"))
