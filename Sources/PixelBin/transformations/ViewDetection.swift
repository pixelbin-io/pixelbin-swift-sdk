import Foundation

public class ViewDetection {
    /**
     * Method for Classifies wear type and view type of products in the image
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "vd",
            name: "detect",
            values: values
        )
    }
}
