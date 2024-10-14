import Foundation

public class VideoUpscalerPlugin {
    /**
     * Method for Video Upscaler Plugin
     *
     * @return TransformationData.
     */
    public func upscale(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "vsr",
            name: "upscale",
            values: values
        )
    }
}
