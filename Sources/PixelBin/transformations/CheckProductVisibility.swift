import Foundation

public class CheckProductVisibility {
    /**
     * Method for Classifies whether the product in the image is completely visible or not
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "cpv",
            name: "detect",
            values: values
        )
    }
}
