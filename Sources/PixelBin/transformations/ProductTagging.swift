import Foundation

public class ProductTagging {
    /**
     * Method for AI Product Tagging
     *
     * @return TransformationData.
     */
    public func tag(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "pr",
            name: "tag",
            values: values
        )
    }
}
