export type Device =
  | "iphone"
  | "ipad"
  | "android"
  | "android-7"
  | "android-10"
  | "feature-graphic"
  | "apple-header"
  | "apple-search";

export type Orientation = "portrait" | "landscape";

export type Platform = "ios" | "android";

// Layouts the editor can render. Vary across slides for visual rhythm.
export type SlideLayout =
  | "hero"             // centered device, headline above
  | "device-bottom"    // headline top, device bottom-center
  | "device-top"       // device top, headline bottom (contrast)
  | "two-devices"      // back + front phones, headline above
  | "no-device"        // big headline + decorative blob, no device
  | "split-landscape"  // landscape tablets only: caption left + device right
  | "feature-graphic"; // 1024×500 banner with icon + name + tagline

// Per-element rect in canvas pixel space. Optional rotation in degrees and zIndex.
export type ElementTransform = {
  x: number;
  y: number;
  width: number;
  height: number;
  rotation?: number;
  zIndex?: number;
};

export type BuiltInElementId = "caption" | "device" | "deviceSecondary";
export type TextElementId = `text:${string}`;
export type ImageElementId = `image:${string}`;
export type ElementId = BuiltInElementId | TextElementId | ImageElementId;

export type SelectedElement = {
  slideId: string;
  elementId: ElementId;
};

// Per-locale text keyed by locale code (e.g. "en", "de"). A locale is absent
// if the user hasn't typed anything for it; renderers fall back to en (see
// lib/locale.ts). The set of locales a project targets lives on
// ProjectState.locales.
export type LocalizedText = Partial<Record<string, string>>;

export type TextElement = {
  id: string;
  text: LocalizedText;
  transform: ElementTransform;
  fontSize?: number;
  fontWeight?: number;
  color?: string;
  align?: "left" | "center" | "right";
  // Optional pill behind the text (chips like "HEVC").
  background?: string;
  // "block" fills the whole rect with `background` (square, flat) instead of a pill.
  variant?: "pill" | "block";
  font?: "display" | "mono";
  lineHeight?: number | string;
  letterSpacing?: string;
  uppercase?: boolean;
  rotation?: number;
};

// Sticker-like image placed on the canvas (photos, icon, doodles).
export type ImageElement = {
  id: string;
  src: string;
  transform: ElementTransform;
  radius?: number;      // px at canvas scale
  border?: number;      // white border width, px at canvas scale
  shadow?: boolean;
  fit?: "cover" | "contain";
};

export type Slide = {
  id: string;
  layout: SlideLayout;
  label: LocalizedText;       // tiny uppercase caption above headline, per locale
  headline: LocalizedText;    // multi-line; newlines are intentional, per locale
  screenshot: string;         // path under /screenshots/ — may contain {locale}
  screenshotSecondary?: string; // for two-devices layout — may contain {locale}
  inverted?: boolean;         // dark background variant
  // Substring of the headline drawn in the accent color with a hand-drawn underline.
  highlight?: LocalizedText;
  // Background image path; "none" forces the plain theme color.
  background?: string;
  // Per-element overrides; when present, replaces layout default placement.
  transforms?: Partial<Record<BuiltInElementId, ElementTransform>>;
  textElements?: TextElement[];
  imageElements?: ImageElement[];
  // Swiss style: top of the mono index row (canvas px) and extra horizontal hairlines.
  indexY?: number;
  rules?: number[];
  marks?: ("tl" | "tr" | "bl" | "br")[];
};

export type ThemeId =
  | "clean-light"
  | "dark-bold"
  | "warm-editorial"
  | "ocean-fresh"
  | "bloom-roast";

export type Theme = {
  id: string;
  name: string;
  bg: string;          // primary background
  bgAlt: string;       // inverted background
  fg: string;          // text on bg
  fgAlt: string;       // text on bgAlt
  accent: string;
  muted: string;
  fontFamily?: string;
  // "swiss": flat paper/ink surfaces, 12-column hairline grid, mono index row.
  style?: "swiss";
  displayFont?: string;
  bgImage?: string;    // background image for regular slides
  bgImageAlt?: string; // background image for inverted slides
};

export type ProjectState = {
  schemaVersion?: number;
  appName: string;
  themeId: string;
  // v1 projects render as isolated screens until the user opts into connected crops.
  connectedCanvas: boolean;
  // Locales this project targets. Drives the toolbar dropdown and bulk export.
  // Single-locale projects ship as ["en"] and hide the locale UI.
  locales: string[];
  locale: string;
  device: Device;
  orientation: Orientation;
  // Per-device slide decks so platform switching preserves work
  slidesByDevice: Record<Device, Slide[]>;
  appIcon?: string;    // path under /public (e.g. /app-icon.png)
};
