import Foundation

public class NSFWDetection {
    /**
     * Method for Detect NSFW content in images
     *
     * @param Minimum Confidence Float (Default: 0.5)
     * @return TransformationData.
     */
    public func detect(
        minimumconfidence: Float? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let minimumconfidence = minimumconfidence {
            values["m"] = String(describing: minimumconfidence)
        }
        return TransformationData(
            plugin: "nsfw",
            name: "detect",
            values: values
        )
    }
}
