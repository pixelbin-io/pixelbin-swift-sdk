import Foundation

public class IntelligentMasking {
    /**
     * Detector options: face, text, number_plate
     */
    public enum Detector: String {
        case face
        case text
        case number_plate
    }

    /**
     * Mask type options: fill_black, pixelate, blur
     */
    public enum Masktype: String {
        case fill_black
        case pixelate
        case blur
    }

    /**
     * Method for Intelligent Masking
     *
     * @param Replacement Image file (Default: )
     * @param Detector Detector? (Default: number_plate)
     * @param Mask Type Mask type? (Default: fill_black)
     * @return TransformationData.
     */
    public func mask(
        replacementimage: String? = nil,
        detector: Detector? = nil,
        masktype: Masktype? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let replacementimage = replacementimage, !replacementimage.isEmpty {
            values["i"] = replacementimage
        }
        if let detector = detector {
            values["d"] = detector.rawValue
        }
        if let masktype = masktype {
            values["m"] = masktype.rawValue
        }
        return TransformationData(
            plugin: "im",
            name: "mask",
            values: values
        )
    }
}
