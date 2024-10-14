import Foundation

public class ObjectDetection {
    /**
     * Method for Detect bounding boxes of objects in the image
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "od",
            name: "detect",
            values: values
        )
    }
}
