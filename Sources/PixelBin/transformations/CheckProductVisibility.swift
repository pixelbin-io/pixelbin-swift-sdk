import Foundation

public class CheckProductVisibility {
    /**
     * Method for Classifies whether the product in the image is completely visible or not
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        return TransformationData(
            plugin: "cpv",
            name: "detect",
            values: values
        )
    }
}
