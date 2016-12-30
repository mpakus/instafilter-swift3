import Foundation

public class BrightnessFilter : Filter{
  // Where is processing begins
  override public func run(_ image: RGBAImage) -> RGBAImage {
    self.image = image
    let level = Double(params["level"]!)!

    for y in 0..<image.height {
      for x in 0..<image.width {
        var pix = prgba(x, y)

        pix.pixel.red = calc(pix.r, level)
        pix.pixel.blue = calc(pix.b, level)
        pix.pixel.green = calc(pix.g, level)

        set(x, y, pix.pixel)
      }
    }

    return self.image!
  }
  
  // Calculate brightness
  internal func calc(_ color: UInt8, _ level: Double) -> UInt8{
    return UInt8(min(255, Double(color) * (level/100)))
  }
}
