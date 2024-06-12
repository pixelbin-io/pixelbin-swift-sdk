import Foundation

public class ProductTagging {
    /**
     * Method for AI Product Tagging
     *
     * @return TransformationData.
     */
    public func tag(
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        return TransformationData(
            plugin: "pr",
            name: "tag",
            values: values
        )
    }
}
