import Foundation

public class TextDetectionandRecognition {
    /**
     * Method for OCR Module
     *
     * @param Detect Only Bool (Default: false)
     * @return TransformationData.
     */
    public func extract(
        detectonly: Bool? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let detectonly = detectonly {
            values["detect_only"] = String(describing: detectonly)
        }
        return TransformationData(
            plugin: "ocr",
            name: "extract",
            values: values
        )
    }
}
