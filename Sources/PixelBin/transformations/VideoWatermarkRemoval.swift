import Foundation

public class VideoWatermarkRemoval {
    /**
     * Method for Video Watermark Removal Plugin
     *
     * @return TransformationData.
     */
    public func remove(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        let values = [String: String]()

        return TransformationData(
            plugin: "wmv",
            name: "remove",
            values: values
        )
    }
}
