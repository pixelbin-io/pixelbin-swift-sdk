import Foundation

public class ImageCentering {
    /**
     * Method for Image Centering Module
     *
     * @param Distance percentage Int (Default: 10)

     * @return TransformationData.
     */
    public func detect(
        distancepercentage: Int? = nil

    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        if let distancepercentage = distancepercentage {
            values["dist_perc"] = String(describing: distancepercentage)
        }

        return TransformationData(
            plugin: "imc",
            name: "detect",
            values: values
        )
    }
}
