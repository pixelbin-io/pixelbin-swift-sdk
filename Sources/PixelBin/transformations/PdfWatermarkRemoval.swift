import Foundation

public class PdfWatermarkRemoval {
    /**
     * Method for PDF Watermark Removal Plugin
     *
     * @return TransformationData.
     */
    public func remove(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "pwr",
            name: "remove",
            values: values
        )
    }
}
