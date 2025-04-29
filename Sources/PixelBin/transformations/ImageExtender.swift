import Foundation

public class ImageExtender {
    /**
     * Method for AI Image Extender
     *
     * @param Bounding Box bbox

     * @param Prompt custom (Default: )

     * @param Guidance Scale Int (Default: 30)

     * @param Number of inference steps Int (Default: 50)

     * @param seed Int (Default: 123)

     * @return TransformationData.
     */
    public func extend(
        boundingbox: String? = nil,

        prompt: String? = nil,

        guidancescale: Int? = nil,

        numberofinferencesteps: Int? = nil,

        seed: Int? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let boundingbox = boundingbox, !boundingbox.isEmpty {
            values["bbox"] = boundingbox
        }

        if let prompt = prompt, !prompt.isEmpty {
            values["p"] = prompt
        }

        if let guidancescale = guidancescale {
            values["gs"] = String(describing: guidancescale)
        }

        if let numberofinferencesteps = numberofinferencesteps {
            values["nis"] = String(describing: numberofinferencesteps)
        }

        if let seed = seed {
            values["sd"] = String(describing: seed)
        }

        return TransformationData(
            plugin: "bg",
            name: "extend",
            values: values
        )
    }
}
