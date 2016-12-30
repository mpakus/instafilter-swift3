import Foundation

public class Filter{
  internal var params: [String: String]
  internal var image: RGBAImage?

  public init(_ params: [String: String] = ["": ""]){
    self.params = params
  }
  
  public func run(_ image: RGBAImage) -> RGBAImage{
    return image
  }
  
  // Transform X, Y coordinates to flat index
  internal func coord(_ x: Int, _ y: Int) -> Int{
    return y * self.image!.width + x
  }
  
  // Return Pixel, RGBA by X, Y coordinates
  internal func prgba(_ x: Int, _ y: Int) -> (pixel: Pixel, r: UInt8, g: UInt8, b: UInt8, a: UInt8){
    let pixel = self.image!.pixels[coord(x, y)]
    return (pixel, UInt8(pixel.red), UInt8(pixel.green), UInt8(pixel.blue), UInt8(pixel.alpha))
  }
  
  // Set Pixel in X, Y coordinates
  internal func set(_ x: Int, _ y: Int, _ pixel: Pixel){
    self.image!.pixels[coord(x, y)] = pixel
  }
}
