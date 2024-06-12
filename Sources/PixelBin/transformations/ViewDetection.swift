import Foundation

public class ViewDetection {
    /**
     * Method for Classifies wear type and view type of products in the image
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Create the values dictionary
        let values = [String: String]()

        return TransformationData(
            plugin: "vd",
            name: "detect",
            values: values
        )
    }
}
