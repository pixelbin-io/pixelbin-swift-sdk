import Foundation

public class SuperResolution {
    /**
     * Type options: 2x, 4x, 8x
     */
    public enum PType: String {
        case _2x = "2x"

        case _4x = "4x"

        case _8x = "8x"
    }

    /**
     * Model options: Picasso, Flash
     */
    public enum Model: String {
        case picasso = "Picasso"

        case flash = "Flash"
    }

    /**
     * Method for Super Resolution Module
     *
     * @param Type Type? (Default: 2x)

     * @param Enhance Face Bool (Default: false)

     * @param Model Model? (Default: Picasso)

     * @param Enhance Quality Bool (Default: false)

     * @return TransformationData.
     */
    public func upscale(
        ptype: PType? = nil,

        enhanceface: Bool? = nil,

        model: Model? = nil,

        enhancequality: Bool? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let ptype = ptype {
            values["t"] = ptype.rawValue
        }

        if let enhanceface = enhanceface {
            values["enhance_face"] = String(describing: enhanceface)
        }

        if let model = model {
            values["model"] = model.rawValue
        }

        if let enhancequality = enhancequality {
            values["enhance_quality"] = String(describing: enhancequality)
        }

        return TransformationData(
            plugin: "sr",
            name: "upscale",
            values: values
        )
    }
}
