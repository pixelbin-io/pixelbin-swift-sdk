import Foundation

public class Transformation {
    // DetectBackgroundType

    /**
     * Classifies the background of a product as plain, clean or busy
     *
     * @return The generated TransformationData.
     */
    public static func detectbackgroundtype(
    ) -> TransformationData {
        // Call the generated class method
        DetectBackgroundType().detect(
        )
    }

    // Artifact

    /**
     * Artifact Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func artifact(
    ) -> TransformationData {
        // Call the generated class method
        Artifact().remove(
        )
    }

    // AWSRekognitionPlugin

    /**
     * Detect objects and text in images
     *
     * @param maximumlabels Maximum labels (Default: 5)

     * @param minpimumconfidence Minimum confidence (Default: 55)

     * @return The generated TransformationData.
     */
    public static func detectlabels(
        maximumlabels: Int? = 5,

        minpimumconfidence: Int? = 55

    ) -> TransformationData {
        // Call the generated class method
        Detectlabels().detectLabels(
            maximumlabels: maximumlabels,

            minpimumconfidence: minpimumconfidence
        )
    }

    /**
     * Detect objects and text in images
     *
     * @param minpimumconfidence Minimum confidence (Default: 55)

     * @return The generated TransformationData.
     */
    public static func moderation(
        minpimumconfidence: Int? = 55

    ) -> TransformationData {
        // Call the generated class method
        Moderation().moderation(
            minpimumconfidence: minpimumconfidence
        )
    }

    // BackgroundGenerator

    /**
     * AI Background Generator
     *
     * @param backgroundprompt Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)

     * @param focus Focus (Default: Product)

     * @param negativeprompt Negative prompt (Default: )

     * @param seed Seed (Default: 123)

     * @return The generated TransformationData.
     */
    public static func backgroundgenerator(
        backgroundprompt: String? = "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",

        focus: BackgroundGenerator.Focus? = BackgroundGenerator.Focus.product,

        negativeprompt: String? = "",

        seed: Int? = 123

    ) -> TransformationData {
        // Call the generated class method
        BackgroundGenerator().bg(
            backgroundprompt: backgroundprompt,

            focus: focus,

            negativeprompt: negativeprompt,

            seed: seed
        )
    }

    // VariationGenerator

    /**
     * AI Variation Generator
     *
     * @param generatevariationprompt Generate variation prompt (Default: )

     * @param noofvariations No. of variations (Default: 1)

     * @param seed Seed (Default: 0)

     * @param autoscale Autoscale input if it exceeds maximum resolution (Default: true)

     * @return The generated TransformationData.
     */
    public static func variationgenerator(
        generatevariationprompt: String? = "",

        noofvariations: Int? = 1,

        seed: Int? = 0,

        autoscale: Bool? = true

    ) -> TransformationData {
        // Call the generated class method
        VariationGenerator().generate(
            generatevariationprompt: generatevariationprompt,

            noofvariations: noofvariations,

            seed: seed,

            autoscale: autoscale
        )
    }

    // EraseBG

    /**
     * EraseBG Background Removal Module
     *
     * @param industryptype Foreground Type (Default: general)

     * @param addshadow Add Shadow (cars only) (Default: false)

     * @param refinpe Refine Output (Default: true)

     * @return The generated TransformationData.
     */
    public static func erasebg(
        industryptype: EraseBG.Industrytype? = EraseBG.Industrytype.general,

        addshadow: Bool? = false,

        refinpe: Bool? = true

    ) -> TransformationData {
        // Call the generated class method
        EraseBG().bg(
            industryptype: industryptype,

            addshadow: addshadow,

            refinpe: refinpe
        )
    }

    // GoogleVisionPlugin

    /**
     * Detect content and text in images
     *
     * @param maximumlabels Maximum labels (Default: 5)

     * @return The generated TransformationData.
     */
    public static func googlevisionplugin(
        maximumlabels: Int? = 5

    ) -> TransformationData {
        // Call the generated class method
        GoogleVisionPlugin().detectLabels(
            maximumlabels: maximumlabels
        )
    }

    // ImageCentering

    /**
     * Image Centering Module
     *
     * @param distancepercentage Distance percentage (Default: 10)

     * @return The generated TransformationData.
     */
    public static func imagecentering(
        distancepercentage: Int? = 10

    ) -> TransformationData {
        // Call the generated class method
        ImageCentering().detect(
            distancepercentage: distancepercentage
        )
    }

    // IntelligentCrop

    /**
     * Intelligent Crop Plugin
     *
     * @param requiredwidth Required width (Default: 0)

     * @param requiredheight Required height (Default: 0)

     * @param paddinpgpercentage Padding percentage (Default: 0)

     * @param mainptainporiginpalaspect Maintain original aspect (Default: false)

     * @param aspectratio Aspect Ratio (16_9 or 2 or 0.25) (Default: )

     * @param gravitytowards Gravity towards (Default: none)

     * @param preferreddirection Preferred direction (Default: center)

     * @param objectptype Object Type (if Gravity is object) (Default: person)

     * @return The generated TransformationData.
     */
    public static func intelligentcrop(
        requiredwidth: Int? = 0,

        requiredheight: Int? = 0,

        paddinpgpercentage: Int? = 0,

        mainptainporiginpalaspect: Bool? = false,

        aspectratio: String? = "",

        gravitytowards: IntelligentCrop.Gravitytowards? = IntelligentCrop.Gravitytowards.none,

        preferreddirection: IntelligentCrop.Preferreddirection? = IntelligentCrop.Preferreddirection.center,

        objectptype: IntelligentCrop.Objecttype? = IntelligentCrop.Objecttype.person

    ) -> TransformationData {
        // Call the generated class method
        IntelligentCrop().crop(
            requiredwidth: requiredwidth,

            requiredheight: requiredheight,

            paddinpgpercentage: paddinpgpercentage,

            mainptainporiginpalaspect: mainptainporiginpalaspect,

            aspectratio: aspectratio,

            gravitytowards: gravitytowards,

            preferreddirection: preferreddirection,

            objectptype: objectptype
        )
    }

    // ObjectCounter

    /**
     * Classifies whether objects in the image are single or multiple
     *
     * @return The generated TransformationData.
     */
    public static func objectcounter(
    ) -> TransformationData {
        // Call the generated class method
        ObjectCounter().detect(
        )
    }

    // NSFWDetection

    /**
     * Detect NSFW content in images
     *
     * @param minpimumconfidence Minimum confidence (Default: 0.5)

     * @return The generated TransformationData.
     */
    public static func nsfwdetection(
        minpimumconfidence: Float? = 0.5

    ) -> TransformationData {
        // Call the generated class method
        NSFWDetection().detect(
            minpimumconfidence: minpimumconfidence
        )
    }

    // NumberPlateDetection

    /**
     * Number Plate Detection Plugin
     *
     * @return The generated TransformationData.
     */
    public static func numberplatedetection(
    ) -> TransformationData {
        // Call the generated class method
        NumberPlateDetection().detect(
        )
    }

    // ObjectDetection

    /**
     * Detect bounding boxes of objects in the image
     *
     * @return The generated TransformationData.
     */
    public static func objectdetection(
    ) -> TransformationData {
        // Call the generated class method
        ObjectDetection().detect(
        )
    }

    // CheckObjectSize

    /**
     * Calculates the percentage of the main object area relative to image dimensions.
     *
     * @param objectthresholdpercent Object threshold percent (Default: 50)

     * @return The generated TransformationData.
     */
    public static func checkobjectsize(
        objectthresholdpercent: Int? = 50

    ) -> TransformationData {
        // Call the generated class method
        CheckObjectSize().detect(
            objectthresholdpercent: objectthresholdpercent
        )
    }

    // TextDetectionandRecognition

    /**
     * OCR Module
     *
     * @param detectonly Detect only (Default: false)

     * @return The generated TransformationData.
     */
    public static func textdetectionandrecognition(
        detectonly: Bool? = false

    ) -> TransformationData {
        // Call the generated class method
        TextDetectionandRecognition().extract(
            detectonly: detectonly
        )
    }

    // PdfWatermarkRemoval

    /**
     * PDF Watermark Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func pdfwatermarkremoval(
    ) -> TransformationData {
        // Call the generated class method
        PdfWatermarkRemoval().remove(
        )
    }

    // ProductTagging

    /**
     * AI Product Tagging
     *
     * @return The generated TransformationData.
     */
    public static func producttagging(
    ) -> TransformationData {
        // Call the generated class method
        ProductTagging().tag(
        )
    }

    // CheckProductVisibility

    /**
     * Classifies whether the product in the image is completely visible or not
     *
     * @return The generated TransformationData.
     */
    public static func checkproductvisibility(
    ) -> TransformationData {
        // Call the generated class method
        CheckProductVisibility().detect(
        )
    }

    // RemoveBG

    /**
     * Remove background from any image
     *
     * @return The generated TransformationData.
     */
    public static func removebg(
    ) -> TransformationData {
        // Call the generated class method
        RemoveBG().bg(
        )
    }

    // Basic

    /**
     * Basic Transformations
     *
     * @param height Height (Default: 0)

     * @param width Width (Default: 0)

     * @param fit Fit (Default: cover)

     * @param background Background (Default: 000000)

     * @param position Position (Default: center)

     * @param algorithm Algorithm (Default: lanczos3)

     * @param dpr Dpr (Default: 1)

     * @return The generated TransformationData.
     */
    public static func resize(
        height: Int? = 0,

        width: Int? = 0,

        fit: Resize.Fit? = Resize.Fit.cover,

        background: String? = "000000",

        position: Resize.Position? = Resize.Position.center,

        algorithm: Resize.Algorithm? = Resize.Algorithm.lanczos3,

        dpr: Float? = 1

    ) -> TransformationData {
        // Call the generated class method
        Resize().resize(
            height: height,

            width: width,

            fit: fit,

            background: background,

            position: position,

            algorithm: algorithm,

            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param quality Quality (Default: 80)

     * @return The generated TransformationData.
     */
    public static func compress(
        quality: Int? = 80

    ) -> TransformationData {
        // Call the generated class method
        Compress().compress(
            quality: quality
        )
    }

    /**
     * Basic Transformations
     *
     * @param top Top (Default: 10)

     * @param left Left (Default: 10)

     * @param bottom Bottom (Default: 10)

     * @param right Right (Default: 10)

     * @param background Background (Default: 000000)

     * @param borderptype Border type (Default: constant)

     * @param dpr Dpr (Default: 1)

     * @return The generated TransformationData.
     */
    public static func extend(
        top: Int? = 10,

        left: Int? = 10,

        bottom: Int? = 10,

        right: Int? = 10,

        background: String? = "000000",

        borderptype: Extend.Bordertype? = Extend.Bordertype.constant,

        dpr: Float? = 1

    ) -> TransformationData {
        // Call the generated class method
        Extend().extend(
            top: top,

            left: left,

            bottom: bottom,

            right: right,

            background: background,

            borderptype: borderptype,

            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param top Top (Default: 10)

     * @param left Left (Default: 10)

     * @param height Height (Default: 50)

     * @param width Width (Default: 20)

     * @param boundinpgbox Bounding box

     * @return The generated TransformationData.
     */
    public static func extract(
        top: Int? = 10,

        left: Int? = 10,

        height: Int? = 50,

        width: Int? = 20,

        boundinpgbox: String?

    ) -> TransformationData {
        // Call the generated class method
        Extract().extract(
            top: top,

            left: left,

            height: height,

            width: width,

            boundinpgbox: boundinpgbox
        )
    }

    /**
     * Basic Transformations
     *
     * @param threshold Threshold (Default: 10)

     * @return The generated TransformationData.
     */
    public static func trim(
        threshold: Int? = 10

    ) -> TransformationData {
        // Call the generated class method
        Trim().trim(
            threshold: threshold
        )
    }

    /**
     * Basic Transformations
     *
     * @param angle Angle (Default: 0)

     * @param background Background (Default: 000000)

     * @return The generated TransformationData.
     */
    public static func rotate(
        angle: Int? = 0,

        background: String? = "000000"

    ) -> TransformationData {
        // Call the generated class method
        Rotate().rotate(
            angle: angle,

            background: background
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func flip(
    ) -> TransformationData {
        // Call the generated class method
        Flip().flip(
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func flop(
    ) -> TransformationData {
        // Call the generated class method
        Flop().flop(
        )
    }

    /**
     * Basic Transformations
     *
     * @param sigma Sigma (Default: 1.5)

     * @return The generated TransformationData.
     */
    public static func sharpen(
        sigma: Float? = 1.5

    ) -> TransformationData {
        // Call the generated class method
        Sharpen().sharpen(
            sigma: sigma
        )
    }

    /**
     * Basic Transformations
     *
     * @param size Size (Default: 3)

     * @return The generated TransformationData.
     */
    public static func median(
        size: Int? = 3

    ) -> TransformationData {
        // Call the generated class method
        Median().median(
            size: size
        )
    }

    /**
     * Basic Transformations
     *
     * @param sigma Sigma (Default: 0.3)

     * @param dpr Dpr (Default: 1)

     * @return The generated TransformationData.
     */
    public static func blur(
        sigma: Float? = 0.3,

        dpr: Float? = 1

    ) -> TransformationData {
        // Call the generated class method
        Blur().blur(
            sigma: sigma,

            dpr: dpr
        )
    }

    /**
     * Basic Transformations
     *
     * @param background Background (Default: 000000)

     * @return The generated TransformationData.
     */
    public static func flatten(
        background: String? = "000000"

    ) -> TransformationData {
        // Call the generated class method
        Flatten().flatten(
            background: background
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func negate(
    ) -> TransformationData {
        // Call the generated class method
        Negate().negate(
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func normalise(
    ) -> TransformationData {
        // Call the generated class method
        Normalise().normalise(
        )
    }

    /**
     * Basic Transformations
     *
     * @param a A (Default: 1)

     * @param b B (Default: 0)

     * @return The generated TransformationData.
     */
    public static func linear(
        a: Int? = 1,

        b: Int? = 0

    ) -> TransformationData {
        // Call the generated class method
        Linear().linear(
            a: a,

            b: b
        )
    }

    /**
     * Basic Transformations
     *
     * @param brightness Brightness (Default: 1)

     * @param saturation Saturation (Default: 1)

     * @param hue Hue (Default: 90)

     * @return The generated TransformationData.
     */
    public static func modulate(
        brightness: Float? = 1,

        saturation: Float? = 1,

        hue: Int? = 90

    ) -> TransformationData {
        // Call the generated class method
        Modulate().modulate(
            brightness: brightness,

            saturation: saturation,

            hue: hue
        )
    }

    /**
     * Basic Transformations
     *
     * @return The generated TransformationData.
     */
    public static func grey(
    ) -> TransformationData {
        // Call the generated class method
        Grey().grey(
        )
    }

    /**
     * Basic Transformations
     *
     * @param color Color (Default: 000000)

     * @return The generated TransformationData.
     */
    public static func tint(
        color: String? = "000000"

    ) -> TransformationData {
        // Call the generated class method
        Tint().tint(
            color: color
        )
    }

    /**
     * Basic Transformations
     *
     * @param format Format (Default: jpeg)

     * @param quality Quality (Default: 75)

     * @return The generated TransformationData.
     */
    public static func toformat(
        format: Toformat.Format? = Toformat.Format.jpeg,

        quality: Int? = 75

    ) -> TransformationData {
        // Call the generated class method
        Toformat().toFormat(
            format: format,

            quality: quality
        )
    }

    /**
     * Basic Transformations
     *
     * @param density Density (Default: 300)

     * @return The generated TransformationData.
     */
    public static func density(
        density: Int? = 300

    ) -> TransformationData {
        // Call the generated class method
        Density().density(
            density: density
        )
    }

    /**
     * Basic Transformations
     *
     * @param mode Mode (Default: overlay)

     * @param image Image (Default: )

     * @param transformation Transformation (Default: )

     * @param background Background (Default: 00000000)

     * @param height Height (Default: 0)

     * @param width Width (Default: 0)

     * @param top Top (Default: 0)

     * @param left Left (Default: 0)

     * @param gravity Gravity (Default: center)

     * @param blend Blend (Default: over)

     * @param tile Tile (Default: false)

     * @param listofbboxes List of bboxes

     * @param listofpolygons List of polygons

     * @return The generated TransformationData.
     */
    public static func merge(
        mode: Merge.Mode? = Merge.Mode.overlay,

        image: String? = "",

        transformation: String? = "",

        background: String? = "00000000",

        height: Int? = 0,

        width: Int? = 0,

        top: Int? = 0,

        left: Int? = 0,

        gravity: Merge.Gravity? = Merge.Gravity.center,

        blend: Merge.Blend? = Merge.Blend.over,

        tile: Bool? = false,

        listofbboxes: String?,

        listofpolygons: String?

    ) -> TransformationData {
        // Call the generated class method
        Merge().merge(
            mode: mode,

            image: image,

            transformation: transformation,

            background: background,

            height: height,

            width: width,

            top: top,

            left: left,

            gravity: gravity,

            blend: blend,

            tile: tile,

            listofbboxes: listofbboxes,

            listofpolygons: listofpolygons
        )
    }

    // SoftShadowGenerator

    /**
     * AI Soft Shadow Generator
     *
     * @param backgroundimage Background image

     * @param backgroundcolor Background color (Default: ffffff)

     * @param shadowangle Shadow angle (Default: 120)

     * @param shadowintensity Shadow intensity (Default: 0.5)

     * @return The generated TransformationData.
     */
    public static func softshadowgenerator(
        backgroundimage: String?,

        backgroundcolor: String? = "ffffff",

        shadowangle: Float? = 120,

        shadowintensity: Float? = 0.5

    ) -> TransformationData {
        // Call the generated class method
        SoftShadowGenerator().gen(
            backgroundimage: backgroundimage,

            backgroundcolor: backgroundcolor,

            shadowangle: shadowangle,

            shadowintensity: shadowintensity
        )
    }

    // SuperResolution

    /**
     * Super Resolution Module
     *
     * @param ptype Type (Default: 2x)

     * @param enhanceface Enhance face (Default: false)

     * @param model Model (Default: Picasso)

     * @param enhancequality Enhance quality (Default: false)

     * @return The generated TransformationData.
     */
    public static func superresolution(
        ptype: SuperResolution.PType? = SuperResolution.PType._2x,

        enhanceface: Bool? = false,

        model: SuperResolution.Model? = SuperResolution.Model.picasso,

        enhancequality: Bool? = false

    ) -> TransformationData {
        // Call the generated class method
        SuperResolution().upscale(
            ptype: ptype,

            enhanceface: enhanceface,

            model: model,

            enhancequality: enhancequality
        )
    }

    // VideoWatermarkRemoval

    /**
     * Video Watermark Removal Plugin
     *
     * @return The generated TransformationData.
     */
    public static func videowatermarkremoval(
    ) -> TransformationData {
        // Call the generated class method
        VideoWatermarkRemoval().remove(
        )
    }

    // ViewDetection

    /**
     * Classifies wear type and view type of products in the image
     *
     * @return The generated TransformationData.
     */
    public static func viewdetection(
    ) -> TransformationData {
        // Call the generated class method
        ViewDetection().detect(
        )
    }

    // WatermarkRemoval

    /**
     * Watermark Removal Plugin
     *
     * @param removetext Remove text (Default: false)

     * @param removelogo Remove logo (Default: false)

     * @param box1 Box 1 (Default: 0_0_100_100)

     * @param box2 Box 2 (Default: 0_0_0_0)

     * @param box3 Box 3 (Default: 0_0_0_0)

     * @param box4 Box 4 (Default: 0_0_0_0)

     * @param box5 Box 5 (Default: 0_0_0_0)

     * @return The generated TransformationData.
     */
    public static func watermarkremoval(
        removetext: Bool? = false,

        removelogo: Bool? = false,

        box1: String? = "0_0_100_100",

        box2: String? = "0_0_0_0",

        box3: String? = "0_0_0_0",

        box4: String? = "0_0_0_0",

        box5: String? = "0_0_0_0"

    ) -> TransformationData {
        // Call the generated class method
        WatermarkRemoval().remove(
            removetext: removetext,

            removelogo: removelogo,

            box1: box1,

            box2: box2,

            box3: box3,

            box4: box4,

            box5: box5
        )
    }

    // WatermarkDetection

    /**
     * Watermark Detection Plugin
     *
     * @param detecttext Detect text (Default: false)

     * @return The generated TransformationData.
     */
    public static func watermarkdetection(
        detecttext: Bool? = false

    ) -> TransformationData {
        // Call the generated class method
        WatermarkDetection().detect(
            detecttext: detecttext
        )
    }
}
