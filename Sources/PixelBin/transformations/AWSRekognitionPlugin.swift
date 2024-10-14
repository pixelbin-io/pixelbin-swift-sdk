import Foundation

public class Detectlabels {
    /**
     * Method for Detect objects and text in images
     *
     * @param Maximum Labels Int (Default: 5)
     * @param Minimum Confidence Int (Default: 55)
     * @return TransformationData.
     */
    public func detectLabels(
        maximumlabels: Int? = nil,
        minimumconfidence: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let maximumlabels = maximumlabels {
            values["l"] = String(describing: maximumlabels)
        }
        if let minimumconfidence = minimumconfidence {
            values["c"] = String(describing: minimumconfidence)
        }
        return TransformationData(
            plugin: "awsRek",
            name: "detectLabels",
            values: values
        )
    }
}

public class Moderation {
    /**
     * Method for Detect objects and text in images
     *
     * @param Minimum Confidence Int (Default: 55)
     * @return TransformationData.
     */
    public func moderation(
        minimumconfidence: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let minimumconfidence = minimumconfidence {
            values["c"] = String(describing: minimumconfidence)
        }
        return TransformationData(
            plugin: "awsRek",
            name: "moderation",
            values: values
        )
    }
}
