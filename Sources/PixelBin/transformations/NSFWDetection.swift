import Foundation

public class NSFWDetection {
    /**
     * Method for Detect NSFW content in images
     *
     * @param Minimum Confidence Float (Default: 0.5)

     * @return TransformationData.
     */
    public func detect(
        minpimumconfidence: Float? = nil

    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        if let minpimumconfidence = minpimumconfidence {
            values["m"] = String(describing: minpimumconfidence)
        }

        return TransformationData(
            plugin: "nsfw",
            name: "detect",
            values: values
        )
    }
}
