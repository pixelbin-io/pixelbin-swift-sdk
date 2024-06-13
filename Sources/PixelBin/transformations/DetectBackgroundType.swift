import Foundation

public class DetectBackgroundType {
    /**
     * Method for Classifies the background of a product as plain, clean or busy
     *
     * @return TransformationData.
     */
    public func detect(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "dbt",
            name: "detect",
            values: values
        )
    }
}
