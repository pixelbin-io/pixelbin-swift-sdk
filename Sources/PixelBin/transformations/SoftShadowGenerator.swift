import Foundation

public class SoftShadowGenerator {
    /**
     * Method for AI Soft Shadow Generator
     *
     * @param Background Image file

     * @param Background Color String (Default: "ffffff")

     * @param Shadow Angle Float (Default: 120)

     * @param Shadow Intensity Float (Default: 0.5)

     * @return TransformationData.
     */
    public func gen(
        backgroundimage: String? = nil,

        backgroundcolor: String? = nil,

        shadowangle: Float? = nil,

        shadowintensity: Float? = nil

    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        if let backgroundimage = backgroundimage, !backgroundimage.isEmpty {
            values["bgi"] = backgroundimage
        }

        if let backgroundcolor = backgroundcolor, !backgroundcolor.isEmpty {
            values["bgc"] = backgroundcolor
        }

        if let shadowangle = shadowangle {
            values["a"] = String(describing: shadowangle)
        }

        if let shadowintensity = shadowintensity {
            values["i"] = String(describing: shadowintensity)
        }

        return TransformationData(
            plugin: "shadow",
            name: "gen",
            values: values
        )
    }
}
