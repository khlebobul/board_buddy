import { decode, encode } from "fast-png";

// Canvas always writes RGBA. Stores need actual 24-bit RGB, including browser downloads.
export function rgbPng(dataUrl: string): Uint8Array {
  const raw = Uint8Array.from(atob(dataUrl.split(",")[1]), c => c.charCodeAt(0));
  const image = decode(raw);
  if (image.depth !== 8 || image.channels !== 4) throw new Error("Expected an 8-bit RGBA canvas");
  const rgb = new Uint8Array(image.width * image.height * 3);
  for (let pixel = 0; pixel < image.width * image.height; pixel++) {
    if (image.data[pixel * 4 + 3] !== 255) throw new Error("Export contains transparent pixels");
    rgb[pixel * 3] = image.data[pixel * 4];
    rgb[pixel * 3 + 1] = image.data[pixel * 4 + 1];
    rgb[pixel * 3 + 2] = image.data[pixel * 4 + 2];
  }
  return encode({ width: image.width, height: image.height, data: rgb, channels: 3, depth: 8 });
}
