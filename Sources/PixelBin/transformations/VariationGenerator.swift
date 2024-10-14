import Foundation

public class VariationGenerator {
    /**
     * Method for AI Variation Generator
     *
     * @param Generate variation prompt custom (Default: )
     * @param No. of Variations Int (Default: 1)
     * @param Seed Int (Default: 0)
     * @param Autoscale Bool (Default: true)
     * @return TransformationData.
     */
    public func generate(
        generatevariationprompt: String? = nil,
        noofvariations: Int? = nil,
        seed: Int? = nil,
        autoscale: Bool? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let generatevariationprompt = generatevariationprompt, !generatevariationprompt.isEmpty {
            values["p"] = generatevariationprompt
        }
        if let noofvariations = noofvariations {
            values["v"] = String(describing: noofvariations)
        }
        if let seed = seed {
            values["s"] = String(describing: seed)
        }
        if let autoscale = autoscale {
            values["auto"] = String(describing: autoscale)
        }
        return TransformationData(
            plugin: "vg",
            name: "generate",
            values: values
        )
    }
}
