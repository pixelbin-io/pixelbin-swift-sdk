import Foundation

public class EraseBG {
    /**
     * Foreground type options: general, ecommerce, car, human, object
     */
    public enum Foregroundtype: String {
        case general

        case ecommerce

        case car

        case human

        case object
    }

    /**
     * Method for EraseBG Background Removal Module
     *
     * @param Foreground Type Foreground type? (Default: general)

     * @param Add Shadow Bool (Default: false)

     * @param Refine Bool (Default: true)

     * @return TransformationData.
     */
    public func bg(
        foregroundptype: Foregroundtype? = nil,

        addshadow: Bool? = nil,

        refinpe: Bool? = nil

    ) -> TransformationData {
        // Create the values dictionary
        var values = [String: String]()

        if let foregroundptype = foregroundptype {
            values["i"] = foregroundptype.rawValue
        }

        if let addshadow = addshadow {
            values["shadow"] = String(describing: addshadow)
        }

        if let refinpe = refinpe {
            values["r"] = String(describing: refinpe)
        }

        return TransformationData(
            plugin: "erase",
            name: "bg",
            values: values
        )
    }
}
