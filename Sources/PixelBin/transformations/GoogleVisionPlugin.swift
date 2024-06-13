import Foundation

public class GoogleVisionPlugin {
    /**
     * Method for Detect content and text in images
     *
     * @param Maximum Labels Int (Default: 5)

     * @return TransformationData.
     */
    public func detectLabels(
        maximumlabels: Int? = nil

    ) -> TransformationData {
        // Determine if there are values to add to the dictionary

        var values = [String: String]()

        if let maximumlabels = maximumlabels {
            values["l"] = String(describing: maximumlabels)
        }

        return TransformationData(
            plugin: "googleVis",
            name: "detectLabels",
            values: values
        )
    }
}
