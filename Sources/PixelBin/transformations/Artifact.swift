import Foundation

public class Artifact {
    /**
     * Method for Artifact Removal Plugin
     *
     * @return TransformationData.
     */
    public func remove(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "af",
            name: "remove",
            values: values
        )
    }
}
