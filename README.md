# Pixelbin

Pixelbin Swift library helps you integrate Pixelbin with your iOS Application.

## Usage

### Installing using Swift Package Manager

1. **Open Your Xcode Project:**
   - Launch Xcode and open your existing project or create a new one.

2. **Open the Swift Packages Tab:**
   - In the project navigator, select your project file to open the project settings.
   - Select the target you want to add the package to.
   - Click on the `Swift Packages` tab.

3. **Add a Swift Package:**
   - Click the `+` button at the bottom left of the `Swift Packages` tab.
   - In the search bar, enter the URL of the repository: `https://github.com/pixelbin-io/pixelbin-kotlin-sdk.git`

4. **Specify Version Rules:**
   - Choose the version rule that fits your needs. You can select from:
     - **Branch:** Specify a branch like `main` or `master`.
     - **Exact Version:** Specify an exact version number.
     - **Range:** Define a version range.

5. **Add the Package:**
   - Click `Next` to fetch the repository and validate the package.
   - After validation, select the package products you need and the target to which they should be added.
   - Click `Finish` to add the package to your project.

### Installing using Cocoapods

Add the dependency to your `Podfile`:

```ruby
pod 'Pixelbin'
```

Install the dependency:

```sh
pod install
```

To add the Pixelbin Kotlin SDK as a Swift Package Manager (SPM) dependency to your iOS project using the provided URL, follow these steps:

### Creating Image from URL or Cloud details

```swift
import PixelbinSwift

guard let imageFromUrl = PixelBin.shared.image(url: "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:false,r:true,i:general)~af.remove()~t.blur(s:0.3,dpr:1.0)/__playground/playground-default.jpeg") else {
    return
}
print(imageFromUrl.encoded)

// Create Image url from cloud, zone and other details
let imageFromDetails = PixelBin.shared.image(imagePath: imageFromUrl.imagePath, cloud: imageFromUrl.cloudName, transformations: imageFromUrl.transformations, version: imageFromUrl.version)
print(imageFromDetails.encoded)
```

---

### Applying Transformations and Getting Transformations

```swift
import PixelbinSwift

// Create Image url from cloud, zone and imagePath on cloud (Not local path)
let image = PixelBin.shared.image(imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia")
print(imageFromDetails.encoded) // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg

let eraseTransformation = Transformation.erasebg() // Creating Erasebg Transformation
let resizeTransformation = Transformation.resize(height: 100, width: 100) // Creating Resize Transformation
image.addTransformation(eraseTransformation, resizeTransformation) // Applying transformation (as varargs, just keep passing all transformations)

let outputUrl = image.encoded // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/erase.bg()~t.resize(h:100,w:100)/example/logo/apple.jpg
```

### Uploading Image and getting url object

```swift
// Signed Url and Field can be generated via using Backed SDK for pixelbin or API to generate signed url for upload

// Assume imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia" & generate details
let signUrl = "SIGNED_URL"
let fields = [] // META_DATA in value

let signedDetails = SignedDetails(url: signUrl, fields: fields)

// Url is local file path, other fields chunkSize: Int = 1024, concurrency: Int = 1
PixelBin.shared.upload(file: url, signedDetails: signedDetails) { result in
    switch result {
    case let .success(response):
        if let image = response.0 {
            print("Uploaded Image Url: \(image.encoded)")  // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg

            let eraseTransformation = Transformation.erasebg() // Creating Erasebg Transformation
            let resizeTransformation = Transformation.tResize(height: 100, width: 100) // Creating Resize Transformation
            image.addTransformation(eraseTransformation, resizeTransformation) // Applying transformation (as varargs, just keep passing all transformations)

            print("Transformed Image Url: \(image.encoded)")  // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/erase.bg()~t.resize(h:100,w:100)/example/logo/apple.jpg
        }
    case let .failure(error):
        print("Error: \(error.localizedDescription)")
    }
}
```

| Parameter                                                                | Type    | Description                                                 |
| ------------------------------------------------------------------------ | ------- | ----------------------------------------------------------- |
| file ([File](https://developer.apple.com/documentation/foundation/file)) | File    | File to upload to Pixelbin                                  |
| signedDetails (SignedDetails)                                            | Object  | Signed details generated with the Pixelbin Backend SDK      |
| chunkSize (Int)                                                          | Integer | Size of chunks to be uploaded in KB (default value is 1024) |
| concurrency (Int)                                                        | Integer | Number of chunks to be uploaded in parallel API calls       |

- Resolves with Image object on success.
- Rejects with error on failure.

## List of Supported Transformations

### DetectBackgroundType

#### 1. dbtDetect()

Classifies the background of a product as plain, clean or busy

```swift
let t = Transformation.dbtDetect(

)
```

### Artifact

#### 1. afRemove()

Artifact Removal Plugin

```swift
let t = Transformation.afRemove(

)
```

### AWSRekognitionPlugin

#### 1. awsrekDetectlabels(Maximum Labels, Minimum Confidence)

Detect objects and text in images

| Parameter          | Type    | Default |
| ------------------ | ------- | ------- |
| Maximum Labels     | integer | `5`     |
| Minimum Confidence | integer | `55`    |

```swift
let t = Transformation.awsrekDetectlabels(
    Maximum Labels: "5",
    Minimum Confidence: "55"
)
```

#### 2. awsrekModeration(Minimum Confidence)

Detect objects and text in images

| Parameter          | Type    | Default |
| ------------------ | ------- | ------- |
| Minimum Confidence | integer | `55`    |

```swift
let t = Transformation.awsrekModeration(
    Minimum Confidence: "55"
)
```

### BackgroundGenerator

#### 1. generateBg(Background prompt, focus, Negative prompt, seed)

AI Background Generator

| Parameter         | Type                          | Default                                                                                                                    |
| ----------------- | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Background prompt | custom                        | `YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr` |
| focus             | enum: `Product`, `Background` | `Product`                                                                                                                  |
| Negative prompt   | custom                        | N/A                                                                                                                        |
| seed              | integer                       | `123`                                                                                                                      |

```swift
let t = Transformation.generateBg(
    Background prompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
    focus: "Product",
    Negative prompt: "",
    seed: "123"
)
```

### VariationGenerator

#### 1. vgGenerate(Generate variation prompt, No. of Variations, Seed, Autoscale)

AI Variation Generator

| Parameter                 | Type    | Default |
| ------------------------- | ------- | ------- |
| Generate variation prompt | custom  | N/A     |
| No. of Variations         | integer | `1`     |
| Seed                      | integer | N/A     |
| Autoscale                 | boolean | `true`  |

```swift
let t = Transformation.vgGenerate(
    Generate variation prompt: "",
    No. of Variations: "1",
    Seed: "",
    Autoscale: "true"
)
```

### EraseBG

#### 1. eraseBg(Industry Type, Add Shadow, Refine)

EraseBG Background Removal Module

| Parameter     | Type                                                   | Default   |
| ------------- | ------------------------------------------------------ | --------- |
| Industry Type | enum: `general`, `ecommerce`, `car`, `human`, `object` | `general` |
| Add Shadow    | boolean                                                | N/A       |
| Refine        | boolean                                                | `true`    |

```swift
let t = Transformation.eraseBg(
    Industry Type: "general",
    Add Shadow: "",
    Refine: "true"
)
```

### GoogleVisionPlugin

#### 1. googlevisDetectlabels(Maximum Labels)

Detect content and text in images

| Parameter      | Type    | Default |
| -------------- | ------- | ------- |
| Maximum Labels | integer | `5`     |

```swift
let t = Transformation.googlevisDetectlabels(
    Maximum Labels: "5"
)
```

### ImageCentering

#### 1. imcDetect(Distance percentage)

Image Centering Module

| Parameter           | Type    | Default |
| ------------------- | ------- | ------- |
| Distance percentage | integer | `10`    |

```swift
let t = Transformation.imcDetect(
    Distance percentage: "10"
)
```

### IntelligentCrop

#### 1. icCrop(Required Width, Required Height, Padding Percentage, Maintain Original Aspect, Aspect Ratio, Gravity Towards, Preferred Direction, Object Type)

Intelligent Crop Plugin

| Parameter                | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Required Width           | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| Required Height          | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| Padding Percentage       | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| Maintain Original Aspect | boolean                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| Aspect Ratio             | string                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | N/A      |
| Gravity Towards          | enum: `object`, `foreground`, `face`, `none`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | `none`   |
| Preferred Direction      | enum: `north_west`, `north`, `north_east`, `west`, `center`, `east`, `south_west`, `south`, `south_east`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | `center` |
| Object Type              | enum: `airplane`, `apple`, `backpack`, `banana`, `baseball_bat`, `baseball_glove`, `bear`, `bed`, `bench`, `bicycle`, `bird`, `boat`, `book`, `bottle`, `bowl`, `broccoli`, `bus`, `cake`, `car`, `carrot`, `cat`, `cell_phone`, `chair`, `clock`, `couch`, `cow`, `cup`, `dining_table`, `dog`, `donut`, `elephant`, `fire_hydrant`, `fork`, `frisbee`, `giraffe`, `hair_drier`, `handbag`, `horse`, `hot_dog`, `keyboard`, `kite`, `knife`, `laptop`, `microwave`, `motorcycle`, `mouse`, `orange`, `oven`, `parking_meter`, `person`, `pizza`, `potted_plant`, `refrigerator`, `remote`, `sandwich`, `scissors`, `sheep`, `sink`, `skateboard`, `skis`, `snowboard`, `spoon`, `sports_ball`, `stop_sign`, `suitcase`, `surfboard`, `teddy_bear`, `tennis_racket`, `tie`, `toaster`, `toilet`, `toothbrush`, `traffic_light`, `train`, `truck`, `tv`, `umbrella`, `vase`, `wine_glass`, `zebra` | `person` |

```swift
let t = Transformation.icCrop(
    Required Width: "",
    Required Height: "",
    Padding Percentage: "",
    Maintain Original Aspect: "",
    Aspect Ratio: "",
    Gravity Towards: "none",
    Preferred Direction: "center",
    Object Type: "person"
)
```

### ObjectCounter

#### 1. ocDetect()

Classifies whether objects in the image are single or multiple

```swift
let t = Transformation.ocDetect(

)
```

### NSFWDetection

#### 1. nsfwDetect(Minimum Confidence)

Detect NSFW content in images

| Parameter          | Type  | Default |
| ------------------ | ----- | ------- |
| Minimum Confidence | float | `0.5`   |

```swift
let t = Transformation.nsfwDetect(
    Minimum Confidence: "0.5"
)
```

### NumberPlateDetection

#### 1. numplateDetect()

Number Plate Detection Plugin

```swift
let t = Transformation.numplateDetect(

)
```

### ObjectDetection

#### 1. odDetect()

Detect bounding boxes of objects in the image

```swift
let t = Transformation.odDetect(

)
```

### CheckObjectSize

#### 1. cosDetect(Object Threshold Percent)

Calculates the percentage of the main object area relative to image dimensions.

| Parameter                | Type    | Default |
| ------------------------ | ------- | ------- |
| Object Threshold Percent | integer | `50`    |

```swift
let t = Transformation.cosDetect(
    Object Threshold Percent: "50"
)
```

### TextDetectionandRecognition

#### 1. ocrExtract(Detect Only)

OCR Module

| Parameter   | Type    | Default |
| ----------- | ------- | ------- |
| Detect Only | boolean | N/A     |

```swift
let t = Transformation.ocrExtract(
    Detect Only: ""
)
```

### PdfWatermarkRemoval

#### 1. pwrRemove()

PDF Watermark Removal Plugin

```swift
let t = Transformation.pwrRemove(

)
```

### ProductTagging

#### 1. prTag()

AI Product Tagging

```swift
let t = Transformation.prTag(

)
```

### CheckProductVisibility

#### 1. cpvDetect()

Classifies whether the product in the image is completely visible or not

```swift
let t = Transformation.cpvDetect(

)
```

### QRCode

#### 1. qrGenerate(width, height, image, margin, qRTypeNumber, qrErrorCorrectionLevel, imageSize, imageMargin, dotsColor, dotsType, dotsBgColor, cornerSquareColor, cornerSquareType, cornerDotsColor, cornerDotsType)

QRCode Plugin

| Parameter              | Type                                                                           | Default  |
| ---------------------- | ------------------------------------------------------------------------------ | -------- |
| width                  | integer                                                                        | `300`    |
| height                 | integer                                                                        | `300`    |
| image                  | custom                                                                         | N/A      |
| margin                 | integer                                                                        | N/A      |
| qRTypeNumber           | integer                                                                        | N/A      |
| qrErrorCorrectionLevel | enum: `L`, `M`, `Q`, `H`                                                       | `Q`      |
| imageSize              | float                                                                          | `0.4`    |
| imageMargin            | integer                                                                        | N/A      |
| dotsColor              | color                                                                          | `000000` |
| dotsType               | enum: `rounded`, `dots`, `classy`, `classy-rounded`, `square`, `extra-rounded` | `square` |
| dotsBgColor            | color                                                                          | `ffffff` |
| cornerSquareColor      | color                                                                          | `000000` |
| cornerSquareType       | enum: `dot`, `square`, `extra-rounded`                                         | `square` |
| cornerDotsColor        | color                                                                          | `000000` |
| cornerDotsType         | enum: `dot`, `square`                                                          | `dot`    |

```swift
let t = Transformation.qrGenerate(
    width: "300",
    height: "300",
    image: "",
    margin: "",
    qRTypeNumber: "",
    qrErrorCorrectionLevel: "Q",
    imageSize: "0.4",
    imageMargin: "",
    dotsColor: "000000",
    dotsType: "square",
    dotsBgColor: "ffffff",
    cornerSquareColor: "000000",
    cornerSquareType: "square",
    cornerDotsColor: "000000",
    cornerDotsType: "dot"
)
```

#### 2. qrScan()

QRCode Plugin

```swift
let t = Transformation.qrScan(

)
```

### RemoveBG

#### 1. removeBg()

Remove background from any image

```swift
let t = Transformation.removeBg(

)
```

### Basic

#### 1. tResize(height, width, fit, background, position, algorithm, DPR)

Basic Transformations

| Parameter  | Type                                                                                                     | Default    |
| ---------- | -------------------------------------------------------------------------------------------------------- | ---------- |
| height     | integer                                                                                                  | N/A        |
| width      | integer                                                                                                  | N/A        |
| fit        | enum: `cover`, `contain`, `fill`, `inside`, `outside`                                                    | `cover`    |
| background | color                                                                                                    | `000000`   |
| position   | enum: `top`, `bottom`, `left`, `right`, `right_top`, `right_bottom`, `left_top`, `left_bottom`, `center` | `center`   |
| algorithm  | enum: `nearest`, `cubic`, `mitchell`, `lanczos2`, `lanczos3`                                             | `lanczos3` |
| DPR        | float                                                                                                    | `1`        |

```swift
let t = Transformation.tResize(
    height: "",
    width: "",
    fit: "cover",
    background: "000000",
    position: "center",
    algorithm: "lanczos3",
    DPR: "1"
)
```

#### 2. tCompress(quality)

Basic Transformations

| Parameter | Type    | Default |
| --------- | ------- | ------- |
| quality   | integer | `80`    |

```swift
let t = Transformation.tCompress(
    quality: "80"
)
```

#### 3. tExtend(top, left, bottom, right, background, Border Type, DPR)

Basic Transformations

| Parameter   | Type                                             | Default    |
| ----------- | ------------------------------------------------ | ---------- |
| top         | integer                                          | `10`       |
| left        | integer                                          | `10`       |
| bottom      | integer                                          | `10`       |
| right       | integer                                          | `10`       |
| background  | color                                            | `000000`   |
| Border Type | enum: `constant`, `replicate`, `reflect`, `wrap` | `constant` |
| DPR         | float                                            | `1`        |

```swift
let t = Transformation.tExtend(
    top: "10",
    left: "10",
    bottom: "10",
    right: "10",
    background: "000000",
    Border Type: "constant",
    DPR: "1"
)
```

#### 4. tExtract(top, left, height, width, Bounding Box)

Basic Transformations

| Parameter    | Type    | Default |
| ------------ | ------- | ------- |
| top          | integer | `10`    |
| left         | integer | `10`    |
| height       | integer | `50`    |
| width        | integer | `20`    |
| Bounding Box | bbox    | N/A     |

```swift
let t = Transformation.tExtract(
    top: "10",
    left: "10",
    height: "50",
    width: "20",
    Bounding Box: ""
)
```

#### 5. tTrim(threshold)

Basic Transformations

| Parameter | Type    | Default |
| --------- | ------- | ------- |
| threshold | integer | `10`    |

```swift
let t = Transformation.tTrim(
    threshold: "10"
)
```

#### 6. tRotate(angle, background)

Basic Transformations

| Parameter  | Type    | Default  |
| ---------- | ------- | -------- |
| angle      | integer | N/A      |
| background | color   | `000000` |

```swift
let t = Transformation.tRotate(
    angle: "",
    background: "000000"
)
```

#### 7. tFlip()

Basic Transformations

```swift
let t = Transformation.tFlip(

)
```

#### 8. tFlop()

Basic Transformations

```swift
let t = Transformation.tFlop(

)
```

#### 9. tSharpen(sigma)

Basic Transformations

| Parameter | Type  | Default |
| --------- | ----- | ------- |
| sigma     | float | `1.5`   |

```swift
let t = Transformation.tSharpen(
    sigma: "1.5"
)
```

#### 10. tMedian(size)

Basic Transformations

| Parameter | Type    | Default |
| --------- | ------- | ------- |
| size      | integer | `3`     |

```swift
let t = Transformation.tMedian(
    size: "3"
)
```

#### 11. tBlur(sigma, DPR)

Basic Transformations

| Parameter | Type  | Default |
| --------- | ----- | ------- |
| sigma     | float | `0.3`   |
| DPR       | float | `1`     |

```swift
let t = Transformation.tBlur(
    sigma: "0.3",
    DPR: "1"
)
```

#### 12. tFlatten(background)

Basic Transformations

| Parameter  | Type  | Default  |
| ---------- | ----- | -------- |
| background | color | `000000` |

```swift
let t = Transformation.tFlatten(
    background: "000000"
)
```

#### 13. tNegate()

Basic Transformations

```swift
let t = Transformation.tNegate(

)
```

#### 14. tNormalise()

Basic Transformations

```swift
let t = Transformation.tNormalise(

)
```

#### 15. tLinear(a, b)

Basic Transformations

| Parameter | Type    | Default |
| --------- | ------- | ------- |
| a         | integer | `1`     |
| b         | integer | N/A     |

```swift
let t = Transformation.tLinear(
    a: "1",
    b: ""
)
```

#### 16. tModulate(brightness, saturation, hue)

Basic Transformations

| Parameter  | Type    | Default |
| ---------- | ------- | ------- |
| brightness | float   | `1`     |
| saturation | float   | `1`     |
| hue        | integer | `90`    |

```swift
let t = Transformation.tModulate(
    brightness: "1",
    saturation: "1",
    hue: "90"
)
```

#### 17. tGrey()

Basic Transformations

```swift
let t = Transformation.tGrey(

)
```

#### 18. tTint(color)

Basic Transformations

| Parameter | Type  | Default  |
| --------- | ----- | -------- |
| color     | color | `000000` |

```swift
let t = Transformation.tTint(
    color: "000000"
)
```

#### 19. tToformat(format, quality)

Basic Transformations

| Parameter | Type                                                       | Default |
| --------- | ---------------------------------------------------------- | ------- |
| format    | enum: `jpeg`, `png`, `webp`, `tiff`, `avif`, `bmp`, `heif` | `jpeg`  |
| quality   | integer                                                    | `75`    |

```swift
let t = Transformation.tToformat(
    format: "jpeg",
    quality: "75"
)
```

#### 20. tDensity(density)

Basic Transformations

| Parameter | Type    | Default |
| --------- | ------- | ------- |
| density   | integer | `300`   |

```swift
let t = Transformation.tDensity(
    density: "300"
)
```

#### 21. tMerge(mode, image, transformation, background, height, width, top, left, gravity, blend, tile, List of bboxes, List of Polygons)

Basic Transformations

| Parameter        | Type                                                                                                                                                                                                                                                                                          | Default    |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| mode             | enum: `overlay`, `underlay`, `wrap`                                                                                                                                                                                                                                                           | `overlay`  |
| image            | file                                                                                                                                                                                                                                                                                          | N/A        |
| transformation   | custom                                                                                                                                                                                                                                                                                        | N/A        |
| background       | color                                                                                                                                                                                                                                                                                         | `00000000` |
| height           | integer                                                                                                                                                                                                                                                                                       | N/A        |
| width            | integer                                                                                                                                                                                                                                                                                       | N/A        |
| top              | integer                                                                                                                                                                                                                                                                                       | N/A        |
| left             | integer                                                                                                                                                                                                                                                                                       | N/A        |
| gravity          | enum: `northwest`, `north`, `northeast`, `east`, `center`, `west`, `southwest`, `south`, `southeast`, `custom`                                                                                                                                                                                | `center`   |
| blend            | enum: `over`, `in`, `out`, `atop`, `dest`, `dest-over`, `dest-in`, `dest-out`, `dest-atop`, `xor`, `add`, `saturate`, `multiply`, `screen`, `overlay`, `darken`, `lighten`, `colour-dodge`, `color-dodge`, `colour-burn`, `color-burn`, `hard-light`, `soft-light`, `difference`, `exclusion` | `over`     |
| tile             | boolean                                                                                                                                                                                                                                                                                       | N/A        |
| List of bboxes   | bboxList                                                                                                                                                                                                                                                                                      | N/A        |
| List of Polygons | polygonList                                                                                                                                                                                                                                                                                   | N/A        |

```swift
let t = Transformation.tMerge(
    mode: "overlay",
    image: "",
    transformation: "",
    background: "00000000",
    height: "",
    width: "",
    top: "",
    left: "",
    gravity: "center",
    blend: "over",
    tile: "",
    List of bboxes: "",
    List of Polygons: ""
)
```

### SoftShadowGenerator

#### 1. shadowGen(Background Image, Background Color, Shadow Angle, Shadow Intensity)

AI Soft Shadow Generator

| Parameter        | Type  | Default  |
| ---------------- | ----- | -------- |
| Background Image | file  | N/A      |
| Background Color | color | `ffffff` |
| Shadow Angle     | float | `120`    |
| Shadow Intensity | float | `0.5`    |

```swift
let t = Transformation.shadowGen(
    Background Image: "",
    Background Color: "ffffff",
    Shadow Angle: "120",
    Shadow Intensity: "0.5"
)
```

### SuperResolution

#### 1. srUpscale(Type, Enhance Face, Model, Enhance Quality)

Super Resolution Module

| Parameter       | Type                     | Default   |
| --------------- | ------------------------ | --------- |
| Type            | enum: `2x`, `4x`, `8x`   | `2x`      |
| Enhance Face    | boolean                  | N/A       |
| Model           | enum: `Picasso`, `Flash` | `Picasso` |
| Enhance Quality | boolean                  | N/A       |

```swift
let t = Transformation.srUpscale(
    Type: "2x",
    Enhance Face: "",
    Model: "Picasso",
    Enhance Quality: ""
)
```

### VertexAI

#### 1. vertexaiGeneratebg(Background prompt, Negative prompt, seed, Guidance Scale)

Vertex AI based transformations

| Parameter         | Type    | Default                                                                                                                    |
| ----------------- | ------- | -------------------------------------------------------------------------------------------------------------------------- |
| Background prompt | custom  | `YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr` |
| Negative prompt   | custom  | N/A                                                                                                                        |
| seed              | integer | `22`                                                                                                                       |
| Guidance Scale    | integer | `60`                                                                                                                       |

```swift
let t = Transformation.vertexaiGeneratebg(
    Background prompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
    Negative prompt: "",
    seed: "22",
    Guidance Scale: "60"
)
```

#### 2. vertexaiRemovebg()

Vertex AI based transformations

```swift
let t = Transformation.vertexaiRemovebg(

)
```

#### 3. vertexaiUpscale(Type)

Vertex AI based transformations

| Parameter | Type             | Default |
| --------- | ---------------- | ------- |
| Type      | enum: `x2`, `x4` | `x2`    |

```swift
let t = Transformation.vertexaiUpscale(
    Type: "x2"
)
```

### VideoWatermarkRemoval

#### 1. wmvRemove()

Video Watermark Removal Plugin

```swift
let t = Transformation.wmvRemove(

)
```

### ViewDetection

#### 1. vdDetect()

Classifies wear type and view type of products in the image

```swift
let t = Transformation.vdDetect(

)
```

### WatermarkRemoval

#### 1. wmRemove(Remove Text, Remove Logo, Box 1, Box 2, Box 3, Box 4, Box 5)

Watermark Removal Plugin

| Parameter   | Type    | Default       |
| ----------- | ------- | ------------- |
| Remove Text | boolean | N/A           |
| Remove Logo | boolean | N/A           |
| Box 1       | string  | `0_0_100_100` |
| Box 2       | string  | `0_0_0_0`     |
| Box 3       | string  | `0_0_0_0`     |
| Box 4       | string  | `0_0_0_0`     |
| Box 5       | string  | `0_0_0_0`     |

```swift
let t = Transformation.wmRemove(
    Remove Text: "",
    Remove Logo: "",
    Box 1: "0_0_100_100",
    Box 2: "0_0_0_0",
    Box 3: "0_0_0_0",
    Box 4: "0_0_0_0",
    Box 5: "0_0_0_0"
)
```

### WatermarkDetection

#### 1. wmcDetect(Detect Text)

Watermark Detection Plugin

| Parameter   | Type    | Default |
| ----------- | ------- | ------- |
| Detect Text | boolean | N/A     |

```swift
let t = Transformation.wmcDetect(
    Detect Text: ""
)
```
