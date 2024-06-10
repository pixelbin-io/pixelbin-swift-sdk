import Foundation



 public class RemoveBG {

    

    /**
     * Method for Remove background from any image
     * 
     * @return TransformationData.
     */
    public func bg(
        
    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        

        return TransformationData(
            plugin: "remove",
            name: "bg",
            values: values
        )
    }
}


