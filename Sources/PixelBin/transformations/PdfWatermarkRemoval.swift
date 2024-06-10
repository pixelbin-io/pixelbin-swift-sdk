import Foundation



 public class PdfWatermarkRemoval {

    

    /**
     * Method for PDF Watermark Removal Plugin
     * 
     * @return TransformationData.
     */
    public func remove(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "pwr",
            name: "remove",
            values: values
        )
    }
}


