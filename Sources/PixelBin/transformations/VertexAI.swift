import Foundation

public class Generatebg {
    /**
     * Method for Vertex AI based transformations
     *
     * @param Background prompt custom (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)

     * @param Negative prompt custom (Default: )

     * @param seed Int (Default: 22)

     * @param Guidance Scale Int (Default: 60)

     * @return TransformationData.
     */
    public func generateBG(
        backgroundprompt: String? = nil,

        negativeprompt: String? = nil,

        seed: Int? = nil,

        guidancescale: Int? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let backgroundprompt = backgroundprompt, !backgroundprompt.isEmpty {
            values["p"] = backgroundprompt
        }

        if let negativeprompt = negativeprompt, !negativeprompt.isEmpty {
            values["np"] = negativeprompt
        }

        if let seed = seed {
            values["s"] = String(describing: seed)
        }

        if let guidancescale = guidancescale {
            values["gs"] = String(describing: guidancescale)
        }

        return TransformationData(
            plugin: "vertexAi",
            name: "generateBG",
            values: values
        )
    }
}

public class Removebg {
    /**
     * Method for Vertex AI based transformations
     *
     * @return TransformationData.
     */
    public func removeBG(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "vertexAi",
            name: "removeBG",
            values: values
        )
    }
}

public class Upscale {
    /**
     * Type options: x2, x4
     */
    public enum PType: String {
        case x2

        case x4
    }

    /**
     * Method for Vertex AI based transformations
     *
     * @param Type Type? (Default: x2)

     * @return TransformationData.
     */
    public func upscale(
        ptype: PType? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let ptype = ptype {
            values["t"] = ptype.rawValue
        }

        return TransformationData(
            plugin: "vertexAi",
            name: "upscale",
            values: values
        )
    }
}
