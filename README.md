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
   - In the search bar, enter the URL of the repository: `https://github.com/pixelbin-io/pixelbin-swift-sdk.git`

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
pod 'Pixelbin', '~> 1.0.3'
```

Install the dependency:

```sh
pod install
```

To add the Pixelbin Swift SDK as a Swift Package Manager (SPM) dependency to your iOS project using the provided URL, follow these steps:

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
            let resizeTransformation = Transformation.resize(height: 100, width: 100) // Creating Resize Transformation
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


### 1. DetectBackgroundType

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.detectbackgroundtype.detect(

)
```
</details>


### 2. Artifact

<details>
<summary>1. remove</summary>

#### Usage Example
```swift
let t = Transformation.artifact.remove(

)
```
</details>


### 3. AWSRekognitionPlugin

<details>
<summary>1. detectLabels</summary>

#### Supported Configuration
| Parameter         | Type    | Default |
| ----------------- | ------- | ------- |
| maximumLabels     | integer | `5`     |
| minimumConfidence | integer | `55`    |


#### Usage Example
```swift
let t = Transformation.awsrekognitionplugin.detectlabels(

    maximumLabels: "5", 

    minimumConfidence: "55"

)
```
</details>

<details>
<summary>2. moderation</summary>

#### Supported Configuration
| Parameter         | Type    | Default |
| ----------------- | ------- | ------- |
| minimumConfidence | integer | `55`    |


#### Usage Example
```swift
let t = Transformation.awsrekognitionplugin.moderation(

    minimumConfidence: "55"

)
```
</details>


### 4. BackgroundGenerator

<details>
<summary>1. bg</summary>

#### Supported Configuration
| Parameter        | Type                          | Default                                                                                                                    |
| ---------------- | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| backgroundPrompt | custom                        | `YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr` |
| focus            | enum: `Product`, `Background` | `Product`                                                                                                                  |
| negativePrompt   | custom                        | N/A                                                                                                                        |
| seed             | integer                       | `123`                                                                                                                      |


#### Usage Example
```swift
let t = Transformation.backgroundgenerator.bg(

    backgroundPrompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr", 

    focus: "Product", 

    negativePrompt: "", 

    seed: "123"

)
```
</details>


### 5. VariationGenerator

<details>
<summary>1. generate</summary>

#### Supported Configuration
| Parameter               | Type    | Default |
| ----------------------- | ------- | ------- |
| generateVariationPrompt | custom  | N/A     |
| noOfVariations          | integer | `1`     |
| seed                    | integer | N/A     |
| autoscale               | boolean | `true`  |


#### Usage Example
```swift
let t = Transformation.variationgenerator.generate(

    generateVariationPrompt: "", 

    noOfVariations: "1", 

    seed: "", 

    autoscale: "true"

)
```
</details>


### 6. EraseBG

<details>
<summary>1. bg</summary>

#### Supported Configuration
| Parameter    | Type                                                   | Default   |
| ------------ | ------------------------------------------------------ | --------- |
| industryType | enum: `general`, `ecommerce`, `car`, `human`, `object` | `general` |
| addShadow    | boolean                                                | N/A       |
| refine       | boolean                                                | `true`    |


#### Usage Example
```swift
let t = Transformation.erasebg.bg(

    industryType: "general", 

    addShadow: "", 

    refine: "true"

)
```
</details>


### 7. GoogleVisionPlugin

<details>
<summary>1. detectLabels</summary>

#### Supported Configuration
| Parameter     | Type    | Default |
| ------------- | ------- | ------- |
| maximumLabels | integer | `5`     |


#### Usage Example
```swift
let t = Transformation.googlevisionplugin.detectlabels(

    maximumLabels: "5"

)
```
</details>


### 8. ImageCentering

<details>
<summary>1. detect</summary>

#### Supported Configuration
| Parameter          | Type    | Default |
| ------------------ | ------- | ------- |
| distancePercentage | integer | `10`    |


#### Usage Example
```swift
let t = Transformation.imagecentering.detect(

    distancePercentage: "10"

)
```
</details>


### 9. IntelligentCrop

<details>
<summary>1. crop</summary>

#### Supported Configuration
| Parameter              | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default  |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| requiredWidth          | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| requiredHeight         | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| paddingPercentage      | integer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| maintainOriginalAspect | boolean                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | N/A      |
| aspectRatio            | string                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | N/A      |
| gravityTowards         | enum: `object`, `foreground`, `face`, `none`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | `none`   |
| preferredDirection     | enum: `north_west`, `north`, `north_east`, `west`, `center`, `east`, `south_west`, `south`, `south_east`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | `center` |
| objectType             | enum: `airplane`, `apple`, `backpack`, `banana`, `baseball_bat`, `baseball_glove`, `bear`, `bed`, `bench`, `bicycle`, `bird`, `boat`, `book`, `bottle`, `bowl`, `broccoli`, `bus`, `cake`, `car`, `carrot`, `cat`, `cell_phone`, `chair`, `clock`, `couch`, `cow`, `cup`, `dining_table`, `dog`, `donut`, `elephant`, `fire_hydrant`, `fork`, `frisbee`, `giraffe`, `hair_drier`, `handbag`, `horse`, `hot_dog`, `keyboard`, `kite`, `knife`, `laptop`, `microwave`, `motorcycle`, `mouse`, `orange`, `oven`, `parking_meter`, `person`, `pizza`, `potted_plant`, `refrigerator`, `remote`, `sandwich`, `scissors`, `sheep`, `sink`, `skateboard`, `skis`, `snowboard`, `spoon`, `sports_ball`, `stop_sign`, `suitcase`, `surfboard`, `teddy_bear`, `tennis_racket`, `tie`, `toaster`, `toilet`, `toothbrush`, `traffic_light`, `train`, `truck`, `tv`, `umbrella`, `vase`, `wine_glass`, `zebra` | `person` |


#### Usage Example
```swift
let t = Transformation.intelligentcrop.crop(

    requiredWidth: "", 

    requiredHeight: "", 

    paddingPercentage: "", 

    maintainOriginalAspect: "", 

    aspectRatio: "", 

    gravityTowards: "none", 

    preferredDirection: "center", 

    objectType: "person"

)
```
</details>


### 10. ObjectCounter

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.objectcounter.detect(

)
```
</details>


### 11. NSFWDetection

<details>
<summary>1. detect</summary>

#### Supported Configuration
| Parameter         | Type  | Default |
| ----------------- | ----- | ------- |
| minimumConfidence | float | `0.5`   |


#### Usage Example
```swift
let t = Transformation.nsfwdetection.detect(

    minimumConfidence: "0.5"

)
```
</details>


### 12. NumberPlateDetection

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.numberplatedetection.detect(

)
```
</details>


### 13. ObjectDetection

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.objectdetection.detect(

)
```
</details>


### 14. CheckObjectSize

<details>
<summary>1. detect</summary>

#### Supported Configuration
| Parameter              | Type    | Default |
| ---------------------- | ------- | ------- |
| objectThresholdPercent | integer | `50`    |


#### Usage Example
```swift
let t = Transformation.checkobjectsize.detect(

    objectThresholdPercent: "50"

)
```
</details>


### 15. TextDetectionandRecognition

<details>
<summary>1. extract</summary>

#### Supported Configuration
| Parameter  | Type    | Default |
| ---------- | ------- | ------- |
| detectOnly | boolean | N/A     |


#### Usage Example
```swift
let t = Transformation.textdetectionandrecognition.extract(

    detectOnly: ""

)
```
</details>


### 16. PdfWatermarkRemoval

<details>
<summary>1. remove</summary>

#### Usage Example
```swift
let t = Transformation.pdfwatermarkremoval.remove(

)
```
</details>


### 17. ProductTagging

<details>
<summary>1. tag</summary>

#### Usage Example
```swift
let t = Transformation.producttagging.tag(

)
```
</details>


### 18. CheckProductVisibility

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.checkproductvisibility.detect(

)
```
</details>


### 19. RemoveBG

<details>
<summary>1. bg</summary>

#### Usage Example
```swift
let t = Transformation.removebg.bg(

)
```
</details>


### 20. Basic

<details>
<summary>1. resize</summary>

#### Supported Configuration
| Parameter  | Type                                                                                                     | Default    |
| ---------- | -------------------------------------------------------------------------------------------------------- | ---------- |
| height     | integer                                                                                                  | N/A        |
| width      | integer                                                                                                  | N/A        |
| fit        | enum: `cover`, `contain`, `fill`, `inside`, `outside`                                                    | `cover`    |
| background | color                                                                                                    | `000000`   |
| position   | enum: `top`, `bottom`, `left`, `right`, `right_top`, `right_bottom`, `left_top`, `left_bottom`, `center` | `center`   |
| algorithm  | enum: `nearest`, `cubic`, `mitchell`, `lanczos2`, `lanczos3`                                             | `lanczos3` |
| dpr        | float                                                                                                    | `1`        |


#### Usage Example
```swift
let t = Transformation.basic.resize(

    height: "", 

    width: "", 

    fit: "cover", 

    background: "000000", 

    position: "center", 

    algorithm: "lanczos3", 

    dpr: "1"

)
```
</details>

<details>
<summary>2. compress</summary>

#### Supported Configuration
| Parameter | Type    | Default |
| --------- | ------- | ------- |
| quality   | integer | `80`    |


#### Usage Example
```swift
let t = Transformation.basic.compress(

    quality: "80"

)
```
</details>

<details>
<summary>3. extend</summary>

#### Supported Configuration
| Parameter  | Type                                             | Default    |
| ---------- | ------------------------------------------------ | ---------- |
| top        | integer                                          | `10`       |
| left       | integer                                          | `10`       |
| bottom     | integer                                          | `10`       |
| right      | integer                                          | `10`       |
| background | color                                            | `000000`   |
| borderType | enum: `constant`, `replicate`, `reflect`, `wrap` | `constant` |
| dpr        | float                                            | `1`        |


#### Usage Example
```swift
let t = Transformation.basic.extend(

    top: "10", 

    left: "10", 

    bottom: "10", 

    right: "10", 

    background: "000000", 

    borderType: "constant", 

    dpr: "1"

)
```
</details>

<details>
<summary>4. extract</summary>

#### Supported Configuration
| Parameter   | Type    | Default |
| ----------- | ------- | ------- |
| top         | integer | `10`    |
| left        | integer | `10`    |
| height      | integer | `50`    |
| width       | integer | `20`    |
| boundingBox | bbox    | N/A     |


#### Usage Example
```swift
let t = Transformation.basic.extract(

    top: "10", 

    left: "10", 

    height: "50", 

    width: "20", 

    boundingBox: ""

)
```
</details>

<details>
<summary>5. trim</summary>

#### Supported Configuration
| Parameter | Type    | Default |
| --------- | ------- | ------- |
| threshold | integer | `10`    |


#### Usage Example
```swift
let t = Transformation.basic.trim(

    threshold: "10"

)
```
</details>

<details>
<summary>6. rotate</summary>

#### Supported Configuration
| Parameter  | Type    | Default  |
| ---------- | ------- | -------- |
| angle      | integer | N/A      |
| background | color   | `000000` |


#### Usage Example
```swift
let t = Transformation.basic.rotate(

    angle: "", 

    background: "000000"

)
```
</details>

<details>
<summary>7. flip</summary>

#### Usage Example
```swift
let t = Transformation.basic.flip(

)
```
</details>

<details>
<summary>8. flop</summary>

#### Usage Example
```swift
let t = Transformation.basic.flop(

)
```
</details>

<details>
<summary>9. sharpen</summary>

#### Supported Configuration
| Parameter | Type  | Default |
| --------- | ----- | ------- |
| sigma     | float | `1.5`   |


#### Usage Example
```swift
let t = Transformation.basic.sharpen(

    sigma: "1.5"

)
```
</details>

<details>
<summary>10. median</summary>

#### Supported Configuration
| Parameter | Type    | Default |
| --------- | ------- | ------- |
| size      | integer | `3`     |


#### Usage Example
```swift
let t = Transformation.basic.median(

    size: "3"

)
```
</details>

<details>
<summary>11. blur</summary>

#### Supported Configuration
| Parameter | Type  | Default |
| --------- | ----- | ------- |
| sigma     | float | `0.3`   |
| dpr       | float | `1`     |


#### Usage Example
```swift
let t = Transformation.basic.blur(

    sigma: "0.3", 

    dpr: "1"

)
```
</details>

<details>
<summary>12. flatten</summary>

#### Supported Configuration
| Parameter  | Type  | Default  |
| ---------- | ----- | -------- |
| background | color | `000000` |


#### Usage Example
```swift
let t = Transformation.basic.flatten(

    background: "000000"

)
```
</details>

<details>
<summary>13. negate</summary>

#### Usage Example
```swift
let t = Transformation.basic.negate(

)
```
</details>

<details>
<summary>14. normalise</summary>

#### Usage Example
```swift
let t = Transformation.basic.normalise(

)
```
</details>

<details>
<summary>15. linear</summary>

#### Supported Configuration
| Parameter | Type    | Default |
| --------- | ------- | ------- |
| a         | integer | `1`     |
| b         | integer | N/A     |


#### Usage Example
```swift
let t = Transformation.basic.linear(

    a: "1", 

    b: ""

)
```
</details>

<details>
<summary>16. modulate</summary>

#### Supported Configuration
| Parameter  | Type    | Default |
| ---------- | ------- | ------- |
| brightness | float   | `1`     |
| saturation | float   | `1`     |
| hue        | integer | `90`    |


#### Usage Example
```swift
let t = Transformation.basic.modulate(

    brightness: "1", 

    saturation: "1", 

    hue: "90"

)
```
</details>

<details>
<summary>17. grey</summary>

#### Usage Example
```swift
let t = Transformation.basic.grey(

)
```
</details>

<details>
<summary>18. tint</summary>

#### Supported Configuration
| Parameter | Type  | Default  |
| --------- | ----- | -------- |
| color     | color | `000000` |


#### Usage Example
```swift
let t = Transformation.basic.tint(

    color: "000000"

)
```
</details>

<details>
<summary>19. toFormat</summary>

#### Supported Configuration
| Parameter | Type                                                       | Default |
| --------- | ---------------------------------------------------------- | ------- |
| format    | enum: `jpeg`, `png`, `webp`, `tiff`, `avif`, `bmp`, `heif` | `jpeg`  |
| quality   | integer                                                    | `75`    |


#### Usage Example
```swift
let t = Transformation.basic.toformat(

    format: "jpeg", 

    quality: "75"

)
```
</details>

<details>
<summary>20. density</summary>

#### Supported Configuration
| Parameter | Type    | Default |
| --------- | ------- | ------- |
| density   | integer | `300`   |


#### Usage Example
```swift
let t = Transformation.basic.density(

    density: "300"

)
```
</details>

<details>
<summary>21. merge</summary>

#### Supported Configuration
| Parameter      | Type                                                                                                                                                                                                                                                                                          | Default    |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| mode           | enum: `overlay`, `underlay`, `wrap`                                                                                                                                                                                                                                                           | `overlay`  |
| image          | file                                                                                                                                                                                                                                                                                          | N/A        |
| transformation | custom                                                                                                                                                                                                                                                                                        | N/A        |
| background     | color                                                                                                                                                                                                                                                                                         | `00000000` |
| height         | integer                                                                                                                                                                                                                                                                                       | N/A        |
| width          | integer                                                                                                                                                                                                                                                                                       | N/A        |
| top            | integer                                                                                                                                                                                                                                                                                       | N/A        |
| left           | integer                                                                                                                                                                                                                                                                                       | N/A        |
| gravity        | enum: `northwest`, `north`, `northeast`, `east`, `center`, `west`, `southwest`, `south`, `southeast`, `custom`                                                                                                                                                                                | `center`   |
| blend          | enum: `over`, `in`, `out`, `atop`, `dest`, `dest-over`, `dest-in`, `dest-out`, `dest-atop`, `xor`, `add`, `saturate`, `multiply`, `screen`, `overlay`, `darken`, `lighten`, `colour-dodge`, `color-dodge`, `colour-burn`, `color-burn`, `hard-light`, `soft-light`, `difference`, `exclusion` | `over`     |
| tile           | boolean                                                                                                                                                                                                                                                                                       | N/A        |
| listOfBboxes   | bboxList                                                                                                                                                                                                                                                                                      | N/A        |
| listOfPolygons | polygonList                                                                                                                                                                                                                                                                                   | N/A        |


#### Usage Example
```swift
let t = Transformation.basic.merge(

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

    listOfBboxes: "", 

    listOfPolygons: ""

)
```
</details>


### 21. SoftShadowGenerator

<details>
<summary>1. gen</summary>

#### Supported Configuration
| Parameter       | Type  | Default  |
| --------------- | ----- | -------- |
| backgroundImage | file  | N/A      |
| backgroundColor | color | `ffffff` |
| shadowAngle     | float | `120`    |
| shadowIntensity | float | `0.5`    |


#### Usage Example
```swift
let t = Transformation.softshadowgenerator.gen(

    backgroundImage: "", 

    backgroundColor: "ffffff", 

    shadowAngle: "120", 

    shadowIntensity: "0.5"

)
```
</details>


### 22. SuperResolution

<details>
<summary>1. upscale</summary>

#### Supported Configuration
| Parameter      | Type                     | Default   |
| -------------- | ------------------------ | --------- |
| type           | enum: `2x`, `4x`, `8x`   | `2x`      |
| enhanceFace    | boolean                  | N/A       |
| model          | enum: `Picasso`, `Flash` | `Picasso` |
| enhanceQuality | boolean                  | N/A       |


#### Usage Example
```swift
let t = Transformation.superresolution.upscale(

    type: "2x", 

    enhanceFace: "", 

    model: "Picasso", 

    enhanceQuality: ""

)
```
</details>


### 23. VideoWatermarkRemoval

<details>
<summary>1. remove</summary>

#### Usage Example
```swift
let t = Transformation.videowatermarkremoval.remove(

)
```
</details>


### 24. ViewDetection

<details>
<summary>1. detect</summary>

#### Usage Example
```swift
let t = Transformation.viewdetection.detect(

)
```
</details>


### 25. WatermarkRemoval

<details>
<summary>1. remove</summary>

#### Supported Configuration
| Parameter  | Type    | Default       |
| ---------- | ------- | ------------- |
| removeText | boolean | N/A           |
| removeLogo | boolean | N/A           |
| box1       | string  | `0_0_100_100` |
| box2       | string  | `0_0_0_0`     |
| box3       | string  | `0_0_0_0`     |
| box4       | string  | `0_0_0_0`     |
| box5       | string  | `0_0_0_0`     |


#### Usage Example
```swift
let t = Transformation.watermarkremoval.remove(

    removeText: "", 

    removeLogo: "", 

    box1: "0_0_100_100", 

    box2: "0_0_0_0", 

    box3: "0_0_0_0", 

    box4: "0_0_0_0", 

    box5: "0_0_0_0"

)
```
</details>


### 26. WatermarkDetection

<details>
<summary>1. detect</summary>

#### Supported Configuration
| Parameter  | Type    | Default |
| ---------- | ------- | ------- |
| detectText | boolean | N/A     |


#### Usage Example
```swift
let t = Transformation.watermarkdetection.detect(

    detectText: ""

)
```
</details>


