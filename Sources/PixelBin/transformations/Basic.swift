import Foundation

public class Resize {
    /**
     * Fit options: cover, contain, fill, inside, outside
     */
    public enum Fit: String {
        case cover
        case contain
        case fill
        case inside
        case outside
    }

    /**
     * Position options: top, bottom, left, right, right_top, right_bottom, left_top, left_bottom, center
     */
    public enum Position: String {
        case top
        case bottom
        case left
        case right
        case right_top
        case right_bottom
        case left_top
        case left_bottom
        case center
    }

    /**
     * Algorithm options: nearest, cubic, mitchell, lanczos2, lanczos3
     */
    public enum Algorithm: String {
        case nearest
        case cubic
        case mitchell
        case lanczos2
        case lanczos3
    }

    /**
     * Method for Basic Transformations
     *
     * @param height Int (Default: 0)
     * @param width Int (Default: 0)
     * @param fit Fit? (Default: cover)
     * @param background String (Default: "000000")
     * @param position Position? (Default: center)
     * @param algorithm Algorithm? (Default: lanczos3)
     * @param DPR Float (Default: 1)
     * @return TransformationData.
     */
    public func resize(
        height: Int? = nil,
        width: Int? = nil,
        fit: Fit? = nil,
        background: String? = nil,
        position: Position? = nil,
        algorithm: Algorithm? = nil,
        dpr: Float? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let height = height {
            values["h"] = String(describing: height)
        }
        if let width = width {
            values["w"] = String(describing: width)
        }
        if let fit = fit {
            values["f"] = fit.rawValue
        }
        if let background = background, !background.isEmpty {
            values["b"] = background
        }
        if let position = position {
            values["p"] = position.rawValue
        }
        if let algorithm = algorithm {
            values["k"] = algorithm.rawValue
        }
        if let dpr = dpr {
            values["dpr"] = String(describing: dpr)
        }
        return TransformationData(
            plugin: "t",
            name: "resize",
            values: values
        )
    }
}

public class Compress {
    /**
     * Method for Basic Transformations
     *
     * @param quality Int (Default: 80)
     * @return TransformationData.
     */
    public func compress(
        quality: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let quality = quality {
            values["q"] = String(describing: quality)
        }
        return TransformationData(
            plugin: "t",
            name: "compress",
            values: values
        )
    }
}

public class Extend {
    /**
     * Border type options: constant, replicate, reflect, wrap
     */
    public enum Bordertype: String {
        case constant
        case replicate
        case reflect
        case wrap
    }

    /**
     * Method for Basic Transformations
     *
     * @param top Int (Default: 10)
     * @param left Int (Default: 10)
     * @param bottom Int (Default: 10)
     * @param right Int (Default: 10)
     * @param background String (Default: "000000")
     * @param Border Type Border type? (Default: constant)
     * @param DPR Float (Default: 1)
     * @return TransformationData.
     */
    public func extend(
        top: Int? = nil,
        left: Int? = nil,
        bottom: Int? = nil,
        right: Int? = nil,
        background: String? = nil,
        bordertype: Bordertype? = nil,
        dpr: Float? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let top = top {
            values["t"] = String(describing: top)
        }
        if let left = left {
            values["l"] = String(describing: left)
        }
        if let bottom = bottom {
            values["b"] = String(describing: bottom)
        }
        if let right = right {
            values["r"] = String(describing: right)
        }
        if let background = background, !background.isEmpty {
            values["bc"] = background
        }
        if let bordertype = bordertype {
            values["bt"] = bordertype.rawValue
        }
        if let dpr = dpr {
            values["dpr"] = String(describing: dpr)
        }
        return TransformationData(
            plugin: "t",
            name: "extend",
            values: values
        )
    }
}

public class Extract {
    /**
     * Method for Basic Transformations
     *
     * @param top Int (Default: 10)
     * @param left Int (Default: 10)
     * @param height Int (Default: 50)
     * @param width Int (Default: 20)
     * @param Bounding Box bbox
     * @return TransformationData.
     */
    public func extract(
        top: Int? = nil,
        left: Int? = nil,
        height: Int? = nil,
        width: Int? = nil,
        boundingbox: String? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let top = top {
            values["t"] = String(describing: top)
        }
        if let left = left {
            values["l"] = String(describing: left)
        }
        if let height = height {
            values["h"] = String(describing: height)
        }
        if let width = width {
            values["w"] = String(describing: width)
        }
        if let boundingbox = boundingbox, !boundingbox.isEmpty {
            values["bbox"] = boundingbox
        }
        return TransformationData(
            plugin: "t",
            name: "extract",
            values: values
        )
    }
}

public class Trim {
    /**
     * Method for Basic Transformations
     *
     * @param threshold Int (Default: 10)
     * @return TransformationData.
     */
    public func trim(
        threshold: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let threshold = threshold {
            values["t"] = String(describing: threshold)
        }
        return TransformationData(
            plugin: "t",
            name: "trim",
            values: values
        )
    }
}

public class Rotate {
    /**
     * Method for Basic Transformations
     *
     * @param angle Int (Default: 0)
     * @param background String (Default: "000000")
     * @return TransformationData.
     */
    public func rotate(
        angle: Int? = nil,
        background: String? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let angle = angle {
            values["a"] = String(describing: angle)
        }
        if let background = background, !background.isEmpty {
            values["b"] = background
        }
        return TransformationData(
            plugin: "t",
            name: "rotate",
            values: values
        )
    }
}

public class Flip {
    /**
     * Method for Basic Transformations
     *
     * @return TransformationData.
     */
    public func flip(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "t",
            name: "flip",
            values: values
        )
    }
}

public class Flop {
    /**
     * Method for Basic Transformations
     *
     * @return TransformationData.
     */
    public func flop(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "t",
            name: "flop",
            values: values
        )
    }
}

public class Sharpen {
    /**
     * Method for Basic Transformations
     *
     * @param sigma Float (Default: 1.5)
     * @return TransformationData.
     */
    public func sharpen(
        sigma: Float? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let sigma = sigma {
            values["s"] = String(describing: sigma)
        }
        return TransformationData(
            plugin: "t",
            name: "sharpen",
            values: values
        )
    }
}

public class Median {
    /**
     * Method for Basic Transformations
     *
     * @param size Int (Default: 3)
     * @return TransformationData.
     */
    public func median(
        size: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let size = size {
            values["s"] = String(describing: size)
        }
        return TransformationData(
            plugin: "t",
            name: "median",
            values: values
        )
    }
}

public class Blur {
    /**
     * Method for Basic Transformations
     *
     * @param sigma Float (Default: 0.3)
     * @param DPR Float (Default: 1)
     * @return TransformationData.
     */
    public func blur(
        sigma: Float? = nil,
        dpr: Float? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let sigma = sigma {
            values["s"] = String(describing: sigma)
        }
        if let dpr = dpr {
            values["dpr"] = String(describing: dpr)
        }
        return TransformationData(
            plugin: "t",
            name: "blur",
            values: values
        )
    }
}

public class Flatten {
    /**
     * Method for Basic Transformations
     *
     * @param background String (Default: "000000")
     * @return TransformationData.
     */
    public func flatten(
        background: String? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let background = background, !background.isEmpty {
            values["b"] = background
        }
        return TransformationData(
            plugin: "t",
            name: "flatten",
            values: values
        )
    }
}

public class Negate {
    /**
     * Method for Basic Transformations
     *
     * @return TransformationData.
     */
    public func negate(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "t",
            name: "negate",
            values: values
        )
    }
}

public class Normalise {
    /**
     * Method for Basic Transformations
     *
     * @return TransformationData.
     */
    public func normalise(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "t",
            name: "normalise",
            values: values
        )
    }
}

public class Linear {
    /**
     * Method for Basic Transformations
     *
     * @param a Int (Default: 1)
     * @param b Int (Default: 0)
     * @return TransformationData.
     */
    public func linear(
        a: Int? = nil,
        b: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let a = a {
            values["a"] = String(describing: a)
        }
        if let b = b {
            values["b"] = String(describing: b)
        }
        return TransformationData(
            plugin: "t",
            name: "linear",
            values: values
        )
    }
}

public class Modulate {
    /**
     * Method for Basic Transformations
     *
     * @param brightness Float (Default: 1)
     * @param saturation Float (Default: 1)
     * @param hue Int (Default: 90)
     * @return TransformationData.
     */
    public func modulate(
        brightness: Float? = nil,
        saturation: Float? = nil,
        hue: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let brightness = brightness {
            values["b"] = String(describing: brightness)
        }
        if let saturation = saturation {
            values["s"] = String(describing: saturation)
        }
        if let hue = hue {
            values["h"] = String(describing: hue)
        }
        return TransformationData(
            plugin: "t",
            name: "modulate",
            values: values
        )
    }
}

public class Grey {
    /**
     * Method for Basic Transformations
     *
     * @return TransformationData.
     */
    public func grey(
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        let values = [String: String]()
        return TransformationData(
            plugin: "t",
            name: "grey",
            values: values
        )
    }
}

public class Tint {
    /**
     * Method for Basic Transformations
     *
     * @param color String (Default: "000000")
     * @return TransformationData.
     */
    public func tint(
        color: String? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let color = color, !color.isEmpty {
            values["c"] = color
        }
        return TransformationData(
            plugin: "t",
            name: "tint",
            values: values
        )
    }
}

public class Toformat {
    /**
     * Format options: jpeg, png, webp, tiff, avif, bmp, heif
     */
    public enum Format: String {
        case jpeg
        case png
        case webp
        case tiff
        case avif
        case bmp
        case heif
    }

    /**
     * Quality options: 100, 95, 90, 85, 80, 75, 70, 60, 50, 40, 30, 20, 10, best, good, eco, low
     */
    public enum Quality: String {
        case _100 = "100"
        case _95 = "95"
        case _90 = "90"
        case _85 = "85"
        case _80 = "80"
        case _75 = "75"
        case _70 = "70"
        case _60 = "60"
        case _50 = "50"
        case _40 = "40"
        case _30 = "30"
        case _20 = "20"
        case _10 = "10"
        case best
        case good
        case eco
        case low
    }

    /**
     * Method for Basic Transformations
     *
     * @param format Format? (Default: jpeg)
     * @param quality Quality? (Default: 75)
     * @return TransformationData.
     */
    public func toFormat(
        format: Format? = nil,
        quality: Quality? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let format = format {
            values["f"] = format.rawValue
        }
        if let quality = quality {
            values["q"] = quality.rawValue
        }
        return TransformationData(
            plugin: "t",
            name: "toFormat",
            values: values
        )
    }
}

public class Density {
    /**
     * Method for Basic Transformations
     *
     * @param density Int (Default: 300)
     * @return TransformationData.
     */
    public func density(
        density: Int? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let density = density {
            values["d"] = String(describing: density)
        }
        return TransformationData(
            plugin: "t",
            name: "density",
            values: values
        )
    }
}

public class Merge {
    /**
     * Mode options: overlay, underlay, wrap
     */
    public enum Mode: String {
        case overlay
        case underlay
        case wrap
    }

    /**
     * Gravity options: northwest, north, northeast, east, center, west, southwest, south, southeast, custom
     */
    public enum Gravity: String {
        case northwest
        case north
        case northeast
        case east
        case center
        case west
        case southwest
        case south
        case southeast
        case custom
    }

    /**
     * Blend options: over, in, out, atop, dest, dest-over, dest-in, dest-out, dest-atop, xor, add, saturate, multiply, screen, overlay, darken, lighten, colour-dodge, color-dodge, colour-burn, color-burn, hard-light, soft-light, difference, exclusion
     */
    public enum Blend: String {
        case over
        case in0 = "in"
        case out
        case atop
        case dest
        case dest_over = "dest-over"
        case dest_in = "dest-in"
        case dest_out = "dest-out"
        case dest_atop = "dest-atop"
        case xor
        case add
        case saturate
        case multiply
        case screen
        case overlay
        case darken
        case lighten
        case colour_dodge = "colour-dodge"
        case color_dodge = "color-dodge"
        case colour_burn = "colour-burn"
        case color_burn = "color-burn"
        case hard_light = "hard-light"
        case soft_light = "soft-light"
        case difference
        case exclusion
    }

    /**
     * Method for Basic Transformations
     *
     * @param mode Mode? (Default: overlay)
     * @param image file (Default: )
     * @param transformation custom (Default: )
     * @param background String (Default: "00000000")
     * @param height Int (Default: 0)
     * @param width Int (Default: 0)
     * @param top Int (Default: 0)
     * @param left Int (Default: 0)
     * @param gravity Gravity? (Default: center)
     * @param blend Blend? (Default: over)
     * @param tile Bool (Default: false)
     * @param List of bboxes bboxList
     * @param List of Polygons polygonList
     * @return TransformationData.
     */
    public func merge(
        mode: Mode? = nil,
        image: String? = nil,
        transformation: String? = nil,
        background: String? = nil,
        height: Int? = nil,
        width: Int? = nil,
        top: Int? = nil,
        left: Int? = nil,
        gravity: Gravity? = nil,
        blend: Blend? = nil,
        tile: Bool? = nil,
        listofbboxes: String? = nil,
        listofpolygons: String? = nil
    ) -> TransformationData {
        // Determine if there are values to add to the dictionary
        var values = [String: String]()
        if let mode = mode {
            values["m"] = mode.rawValue
        }
        if let image = image, !image.isEmpty {
            values["i"] = image
        }
        if let transformation = transformation, !transformation.isEmpty {
            values["tr"] = transformation
        }
        if let background = background, !background.isEmpty {
            values["bg"] = background
        }
        if let height = height {
            values["h"] = String(describing: height)
        }
        if let width = width {
            values["w"] = String(describing: width)
        }
        if let top = top {
            values["t"] = String(describing: top)
        }
        if let left = left {
            values["l"] = String(describing: left)
        }
        if let gravity = gravity {
            values["g"] = gravity.rawValue
        }
        if let blend = blend {
            values["b"] = blend.rawValue
        }
        if let tile = tile {
            values["r"] = String(describing: tile)
        }
        if let listofbboxes = listofbboxes, !listofbboxes.isEmpty {
            values["bboxes"] = listofbboxes
        }
        if let listofpolygons = listofpolygons, !listofpolygons.isEmpty {
            values["polys"] = listofpolygons
        }
        return TransformationData(
            plugin: "t",
            name: "merge",
            values: values
        )
    }
}
