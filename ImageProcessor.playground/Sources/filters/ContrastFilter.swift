import Foundation

public class ContrastFilter : Filter{
  // Where is processing begins
  override public func run(_ image: RGBAImage) -> RGBAImage {
    self.image = image
    let level = Double(params["level"]!)!
    let factor = Double(259 * (level + 255)) / (255 * (259 - level))
    
    for y in 0..<image.height {
      for x in 0..<image.width {
        var pix = prgba(x, y)
        
        pix.pixel.red = calc(pix.r, factor)
        pix.pixel.blue = calc(pix.b, factor)
        pix.pixel.green = calc(pix.g, factor)
        
        set(x, y, pix.pixel)
      }
    }
    
    return self.image!
  }
  
  // Calculate brightness
  internal func calc(_ color: UInt8, _ factor: Double) -> UInt8{
    let colorDouble = Double(color)
    let count = (factor * (colorDouble - 128)) + 128
    return UInt8( min(255, max(0, count)) )
  }
}
