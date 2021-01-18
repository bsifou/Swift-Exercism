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
        //  var rna = self
        // var arrayOfCodons : [String] = []
        //        while !rna.isEmpty {
        //            arrayOfCodons.append(String(rna.prefix(3)))
        //            rna = String(rna.dropFirst(3))
        //        }
        //
        // return arrayOfCodons
    
        return stride(from: 0, to: self.count, by: 3)
            .reduce(into: []) {codons, idx in
                codons.append(String(self[self.index(self.startIndex, offsetBy: idx)..<self.index(self.startIndex, offsetBy: idx + 3)]))
            }
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
            let protein = try translationOfCodon(c)
            if (protein == "STOP") {
                break
            }
            proteins.append(protein)
        }
        return proteins
    }
}


