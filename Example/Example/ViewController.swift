//
//  ViewController.swift
//  Example
//
//  Created by Dipendra Sharma on 10/06/24.
//

import PixelBin
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()

    override func viewDidAppear(_: Bool) {
        pickImage()
    }

    func pickImage() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            saveAndUpload(image: image)
        }
    }

    func saveAndUpload(image: UIImage) {
        do {
            let savedImageURL = try saveToDocuments(image: image)
            print("Image saved at: \(savedImageURL)")
            upload(url: savedImageURL)
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
        }
    }

    func saveToDocuments(image: UIImage) throws -> URL {
        let imageFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imageURL = imageFolder.appendingPathComponent("\(UUID()).jpg")
        let jpegData = image.jpegData(compressionQuality: 0.5)
        try jpegData?.write(to: imageURL, options: .atomic)
        return imageURL
    }

    func upload(url: URL) {
        let signUrl = "https://api.pixelbin.io/service/public/assets/v1.0/signed-multipart?pbs=eb1e810924d5bb3eb7d76cd4a14603374eece2d4e16e51221606f1a2c4595148&pbe=1718200249798&pbt=702bc431-13b8-44a2-9e14-e4ea601fcfd1&pbo=5332574&pbu=f5a340b8-d9db-480a-b8ea-10a0433cee1a"
        let fields = [
            "x-pixb-meta-assetdata": "{\"orgId\":5332574,\"type\":\"file\",\"name\":\"avatar.jpeg\",\"path\":\"\",\"fileId\":\"avatar.jpeg\",\"format\":\"jpeg\",\"s3Bucket\":\"erase-erase-erasebg-assets\",\"s3Key\":\"uploads/dipendra-cloud1/original/21fd7e40-3082-4cfe-89aa-dca2016a0590.jpeg\",\"access\":\"public-read\",\"tags\":[\"people\",\"dipendra\"],\"metadata\":{\"source\":\"signedUrl\",\"publicUploadId\":\"f5a340b8-d9db-480a-b8ea-10a0433cee1a\"},\"overwrite\":false,\"filenameOverride\":true}",
        ]
        let signedDetails = SignedDetails(url: signUrl, fields: fields)
        PixelBin.shared.upload(file: url, signedDetails: signedDetails) { result in
            switch result {
            case let .success(response):
                if let image = response.0 {
                    print("Uploaded Image Url: \(image.encoded)")
                    image.addTransformation(Transformation.eraseBg())
                    print("Transformed Image Url: \(image.encoded)")
                }
            case let .failure(error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
