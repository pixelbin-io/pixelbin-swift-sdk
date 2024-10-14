import Foundation

public class Generate {
    /**
     * QR Error Correction Level options: L, M, Q, H
     */
    public enum Qrerrorcorrectionlevel: String {
        case l = "L"
        case m = "M"
        case q = "Q"
        case h = "H"
    }

    /**
     * Dots Type options: rounded, dots, classy, classy-rounded, square, extra-rounded
     */
    public enum Dotstype: String {
        case rounded
        case dots
        case classy
        case classy_rounded = "classy-rounded"
        case square
        case extra_rounded = "extra-rounded"
    }

    /**
     * Corner Square Type options: dot, square, extra-rounded
     */
    public enum Cornersquaretype: String {
        case dot
        case square
        case extra_rounded = "extra-rounded"
    }

    /**
     * Corner Dots Type options: dot, square
     */
    public enum Cornerdotstype: String {
        case dot
        case square
    }

    /**
     * Method for QRCode Plugin
     *
     * @param width Int (Default: 300)
     * @param height Int (Default: 300)
     * @param image custom (Default: )
     * @param margin Int (Default: 0)
     * @param qRTypeNumber Int (Default: 0)
     * @param qrErrorCorrectionLevel Qrerrorcorrectionlevel? (Default: Q)
     * @param imageSize Float (Default: 0.4)
     * @param imageMargin Int (Default: 0)
     * @param dotsColor String (Default: "000000")
     * @param dotsType Dotstype? (Default: square)
     * @param dotsBgColor String (Default: "ffffff")
     * @param cornerSquareColor String (Default: "000000")
     * @param cornerSquareType Cornersquaretype? (Default: square)
     * @param cornerDotsColor String (Default: "000000")
     * @param cornerDotsType Cornerdotstype? (Default: dot)
     * @return TransformationData.
     */
    public func generate(
        width: Int? = nil,
        height: Int? = nil,
        image: String? = nil,
        margin: Int? = nil,
        qrtypenumber: Int? = nil,
        qrerrorcorrectionlevel: Qrerrorcorrectionlevel? = nil,
        imagesize: Float? = nil,
        imagemargin: Int? = nil,
        dotscolor: String? = nil,
        dotstype: Dotstype? = nil,
        dotsbgcolor: String? = nil,
        cornersquarecolor: String? = nil,
        cornersquaretype: Cornersquaretype? = nil,
        cornerdotscolor: String? = nil,
        cornerdotstype: Cornerdotstype? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let width = width {
            values["w"] = String(describing: width)
        }
        if let height = height {
            values["h"] = String(describing: height)
        }
        if let image = image, !image.isEmpty {
            values["i"] = image
        }
        if let margin = margin {
            values["m"] = String(describing: margin)
        }
        if let qrtypenumber = qrtypenumber {
            values["qt"] = String(describing: qrtypenumber)
        }
        if let qrerrorcorrectionlevel = qrerrorcorrectionlevel {
            values["qe"] = qrerrorcorrectionlevel.rawValue
        }
        if let imagesize = imagesize {
            values["is"] = String(describing: imagesize)
        }
        if let imagemargin = imagemargin {
            values["im"] = String(describing: imagemargin)
        }
        if let dotscolor = dotscolor, !dotscolor.isEmpty {
            values["ds"] = dotscolor
        }
        if let dotstype = dotstype {
            values["dt"] = dotstype.rawValue
        }
        if let dotsbgcolor = dotsbgcolor, !dotsbgcolor.isEmpty {
            values["bg"] = dotsbgcolor
        }
        if let cornersquarecolor = cornersquarecolor, !cornersquarecolor.isEmpty {
            values["csc"] = cornersquarecolor
        }
        if let cornersquaretype = cornersquaretype {
            values["cst"] = cornersquaretype.rawValue
        }
        if let cornerdotscolor = cornerdotscolor, !cornerdotscolor.isEmpty {
            values["cdc"] = cornerdotscolor
        }
        if let cornerdotstype = cornerdotstype {
            values["cdt"] = cornerdotstype.rawValue
        }
        return TransformationData(
            plugin: "qr",
            name: "generate",
            values: values
        )
    }
}

public class Scan {
    /**
     * Method for QRCode Plugin
     *
     * @return TransformationData.
     */
    public func scan(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "qr",
            name: "scan",
            values: values
        )
    }
}
