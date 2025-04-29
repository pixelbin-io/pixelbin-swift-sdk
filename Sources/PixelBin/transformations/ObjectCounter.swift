import Foundation

public class ObjectCounter {
    /**
     * Method for Classifies whether objects in the image are single or multiple
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "oc",
            name: "detect",
            values: values
        )
    }
}
