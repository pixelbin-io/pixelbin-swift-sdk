import Foundation

public class ObjectDetection {
    /**
     * Method for Detect bounding boxes of objects in the image
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Create the values dictionary
        let values = [String: String]()

        return TransformationData(
            plugin: "od",
            name: "detect",
            values: values
        )
    }
}
