import Foundation

public class GrayscaleFilter : Filter{
  // Where is processing begins
  override public func run(_ image: RGBAImage) -> RGBAImage {
    self.image = image
    for y in 0..<image.height {
      for x in 0..<image.width {
        var pix = prgba(x, y)
        let v = calc(pix.pixel)
        
        pix.pixel.red = v
        pix.pixel.blue = v
        pix.pixel.green = v
        
        set(x, y, pix.pixel)
      }
    }
    
    return self.image!
  }
  
  // Calculate brightness
  internal func calc(_ pixel: Pixel) -> UInt8{
    return UInt8( min(255, 0.299*Double(pixel.red) + 0.587*Double(pixel.green) + 0.114*Double(pixel.blue)) )
  }
}
