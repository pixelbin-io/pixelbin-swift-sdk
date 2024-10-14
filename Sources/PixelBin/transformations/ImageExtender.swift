import Foundation

public class ImageExtender {
    /**
     * Method for AI Image Extender
     *
     * @param Bounding Box bbox
     * @param Prompt custom (Default: )
     * @param Negative Prompt custom (Default: )
     * @param Strength Float (Default: 0.999)
     * @param Guidance Scale Int (Default: 8)
     * @param Number of inference steps Int (Default: 10)
     * @param Color Adjust Bool (Default: false)
     * @param seed Int (Default: 123)
     * @return TransformationData.
     */
    public func extend(
        boundingbox: String? = nil,
        prompt: String? = nil,
        negativeprompt: String? = nil,
        strength: Float? = nil,
        guidancescale: Int? = nil,
        numberofinferencesteps: Int? = nil,
        coloradjust: Bool? = nil,
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
        if let negativeprompt = negativeprompt, !negativeprompt.isEmpty {
            values["np"] = negativeprompt
        }
        if let strength = strength {
            values["s"] = String(describing: strength)
        }
        if let guidancescale = guidancescale {
            values["gs"] = String(describing: guidancescale)
        }
        if let numberofinferencesteps = numberofinferencesteps {
            values["nis"] = String(describing: numberofinferencesteps)
        }
        if let coloradjust = coloradjust {
            values["ca"] = String(describing: coloradjust)
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
