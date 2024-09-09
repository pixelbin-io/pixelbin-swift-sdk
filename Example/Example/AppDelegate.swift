//
//  AppDelegate.swift
//  Example
//
//  Created by Dipendra Sharma on 10/06/24.
//

import PixelBin
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let imageFromUrl = PixelBin.shared.image(url: "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:false,r:true,i:general)~af.remove()~t.blur(s:0.3,dpr:1.0)/__playground/playground-default.jpeg") else {
            return true
        }
        print(imageFromUrl.encoded)

        let imageFromDetails = PixelBin.shared.image(imagePath: imageFromUrl.imagePath, cloud: imageFromUrl.cloudName, transformations: imageFromUrl.transformations, version: imageFromUrl.version)
        print(imageFromDetails.encoded)

        return true
    }
}
