import Foundation

public class RemoveBG {
    /**
     * Method for Remove background from any image
     *
     * @return TransformationData.
     */
    public func bg(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "remove",
            name: "bg",
            values: values
        )
    }
}
