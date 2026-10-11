"use client";
import * as React from "react";
import type { Slide, Theme } from "@/lib/types";
import { pickText, resolveScreenshot } from "@/lib/locale";
import { img } from "@/lib/image-cache";
import { useFitText } from "@/lib/use-fit-text";
import { Phone, AndroidPhone } from "./device-frames";
import { isSwiss, SwissBackground, swissHeadlineStyle, SwissHeadlineText, swissMono } from "./swiss";

// Landscape banners: headline on the left columns, two upright phones on the
// right, cropped by the bottom edge.
function SwissBanner({ slide, cW, cH, theme, locale, appName, editable, onHeadlineChange }: {
  slide: Slide; cW: number; cH: number; theme: Theme; locale: string;
  appName?: string; editable?: boolean; onHeadlineChange?: (v: string) => void;
}) {
  const text = pickText(slide.headline, locale);
  const label = pickText(slide.label, locale);
  const search = cH / cW > 0.6;
  const play = cW === 1024;
  const M = cW * 0.035;
  const col = (cW - 2 * M) / 12;
  const headCols = search ? 6 : 6.5;
  const style = swissHeadlineStyle(theme, locale, cH * (search ? 0.135 : 0.165), theme.fg);
  const ref = useFitText(text, style, true);
  const subStyle = { ...swissMono(theme, cH * (search ? 0.026 : 0.034), theme.fg), whiteSpace: "pre-wrap" as const };
  const subRef = useFitText(label, subStyle, true);
  const Frame = play ? AndroidPhone : Phone;
  const phoneH = cH * (search ? 0.82 : 0.98);
  const phoneW = phoneH * (play ? 9 / 19.5 : 1022 / 2082);
  const phoneTop = cH * (search ? 0.25 : 0.27);
  const x1 = M + col * (search ? 6.5 : 7);
  const x2 = x1 + phoneW + col * 0.5;
  const frame: Slide = { ...slide, indexY: cH * 0.06, marks: ["bl"] };
  return (
    <div style={{ width: "100%", height: "100%", position: "relative", overflow: "hidden" }}>
      <SwissBackground slide={frame} cW={cW} cH={cH} theme={theme} locale={locale} appName={appName}
        section="" count="→" metrics={{ s: cH / 1176, w: cH / 1100, M, col }} />
      <div style={{ position: "absolute", left: M, top: cH * (search ? 0.2 : 0.22), width: col * headCols }}>
        <div ref={ref} data-fit-text style={style} contentEditable={editable} suppressContentEditableWarning
          onInput={e => onHeadlineChange?.(e.currentTarget.innerText)}>
          <SwissHeadlineText text={text} highlight={pickText(slide.highlight, locale)} theme={theme} inverted={false} bleed={M + 2} />
        </div>
        <div ref={subRef} data-fit-text style={{ ...subStyle, marginTop: cH * 0.06 }}>{label}</div>
      </div>
      <Frame src={resolveScreenshot(slide.screenshot, locale)} hideEmpty style={{ position: "absolute", width: phoneW, left: x1, top: phoneTop }} />
      <Frame src={resolveScreenshot(slide.screenshotSecondary || slide.screenshot, locale)} hideEmpty
        style={{ position: "absolute", width: phoneW, left: x2, top: phoneTop + cH * 0.08 }} />
    </div>
  );
}

export function BannerCanvas({ slide, cW, cH, theme, locale, appName, appIcon, editable, onHeadlineChange, onLabelChange }: {
  slide: Slide; cW: number; cH: number; theme: Theme; locale: string;
  appName?: string; appIcon?: string; editable?: boolean;
  onHeadlineChange?: (v: string) => void; onLabelChange?: (v: string) => void;
}) {
  if (isSwiss(theme)) {
    return <SwissBanner slide={slide} cW={cW} cH={cH} theme={theme} locale={locale} appName={appName} editable={editable} onHeadlineChange={onHeadlineChange} />;
  }
  const text = pickText(slide.headline, locale);
  const label = pickText(slide.label, locale);
  const search = cH / cW > 0.6;
  const play = cW === 1024;
  const font = theme.fontFamily;
  const style: React.CSSProperties = { fontFamily: font, fontSize: cH * (search ? 0.077 : 0.105), fontWeight: 400, lineHeight: 1.18, wordSpacing: "0.06em", letterSpacing: "-0.025em", whiteSpace: "pre-wrap", color: theme.fg };
  const ref = useFitText(text, style, true);
  const labelStyle: React.CSSProperties = { fontFamily: font, fontSize: cH * (search ? 0.031 : 0.041), lineHeight: 1.4, color: theme.muted, whiteSpace: "pre-wrap" };
  const labelRef = useFitText(label, labelStyle, true);
  const Frame = play ? AndroidPhone : Phone;
  const width = search ? cW * 0.175 : cH * 0.35;
  return <div style={{ width: "100%", height: "100%", background: theme.bg, position: "relative", overflow: "hidden" }}>
    <div style={{ position: "absolute", left: cW * 0.07, top: cH * (search ? 0.055 : 0.13), width: cW * (search ? 0.86 : 0.49), textAlign: search ? "center" : "left" }}>
      <div style={{ display: "flex", gap: cH * 0.025, alignItems: "center", justifyContent: search ? "center" : "start", marginBottom: cH * (search ? 0.025 : 0.04) }}>
        {appIcon && <img alt="" src={img(appIcon)} style={{ width: cH * 0.09, height: cH * 0.09, borderRadius: cH * 0.02 }} />}
        <span style={{ fontFamily: font, fontSize: cH * 0.042, color: theme.accent }}>{appName}</span>
      </div>
      <div ref={ref} data-fit-text style={style} contentEditable={editable} suppressContentEditableWarning onInput={e => onHeadlineChange?.(e.currentTarget.innerText)}>{text}</div>
      <div ref={labelRef} data-fit-text style={{ ...labelStyle, marginTop: cH * 0.028 }} contentEditable={editable} suppressContentEditableWarning onInput={e => onLabelChange?.(e.currentTarget.innerText)}>{label}</div>
    </div>
    <Frame src={resolveScreenshot(slide.screenshot, locale)} hideEmpty style={{ position: "absolute", width, left: cW * (search ? 0.25 : 0.60), top: cH * (search ? 0.45 : 0.11), filter: "drop-shadow(0 18px 24px #20202030)" }} />
    <Frame src={resolveScreenshot(slide.screenshotSecondary || slide.screenshot, locale)} hideEmpty style={{ position: "absolute", width, left: cW * (search ? 0.575 : 0.76), top: cH * (search ? 0.45 : 0.18), filter: "drop-shadow(0 18px 24px #20202030)" }} />
  </div>;
}
