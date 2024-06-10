import Foundation



 public class VideoWatermarkRemoval {

    

    /**
     * Method for Video Watermark Removal Plugin
     * 
     * @return TransformationData.
     */
    public func remove(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "wmv",
            name: "remove",
            values: values
        )
    }
}


