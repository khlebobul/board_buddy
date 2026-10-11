"use client";
import * as React from "react";
import type { Slide, Theme } from "@/lib/types";
import { pickText } from "@/lib/locale";

export const isSwiss = (theme: Theme) => theme.style === "swiss";

// 72px margins and 12 columns at the 1320px design width; type follows the
// shorter axis so wide tablets don't get headlines taller than the device.
export function swissMetrics(cW: number, cH: number) {
  const w = cW / 1320;
  const s = Math.min(w, (cH / 2868) * 1.25);
  const M = 72 * w;
  const col = (cW - 2 * M) / 12;
  return { w, s, M, col };
}

const CJK = new Set(["zh", "ja", "ko"]);

// Tight display tracking breaks CJK and Devanagari conjuncts/matras.
export function swissHeadlineStyle(theme: Theme, locale: string, size: number, color: string): React.CSSProperties {
  return {
    fontFamily: theme.displayFont,
    fontWeight: 800,
    fontSize: size,
    lineHeight: CJK.has(locale) ? 1.06 : locale === "hi" ? 1.15 : 0.9,
    letterSpacing: CJK.has(locale) ? "-0.01em" : locale === "hi" ? "0" : "-0.045em",
    color,
    // Fit-text sizes the lines; wrapping would break the edge-bleeding block.
    whiteSpace: "pre",
    textAlign: "left",
  };
}

export function swissMono(theme: Theme, size: number, color: string): React.CSSProperties {
  return {
    fontFamily: theme.fontFamily,
    fontSize: size,
    lineHeight: 1.2,
    letterSpacing: "0.06em",
    textTransform: "uppercase",
    color,
    whiteSpace: "nowrap",
  };
}

// Paper: the highlight becomes an ink-text accent block bleeding off the left
// edge. Ink: the highlight is simply drawn in the accent color.
export function SwissHeadlineText({
  text,
  highlight,
  theme,
  inverted,
  bleed,
}: {
  text: string;
  highlight?: string;
  theme: Theme;
  inverted: boolean;
  bleed: number;
}) {
  const at = highlight ? text.indexOf(highlight) : -1;
  if (!highlight || at < 0) return <>{text}</>;
  const lineStart = at === 0 || text[at - 1] === "\n";
  const before = text.slice(0, at);
  const after = text.slice(at + highlight.length);
  if (inverted) {
    return (
      <>
        {before}
        <span style={{ color: theme.accent }}>{highlight}</span>
        {after}
      </>
    );
  }
  return (
    <>
      {before}
      <span
        data-bleed
        style={{
          display: "inline-block",
          background: theme.accent,
          color: theme.fg,
          marginTop: "0.1em",
          marginLeft: lineStart ? -bleed : "-0.06em",
          paddingLeft: lineStart ? bleed : "0.06em",
          paddingRight: "0.14em",
          paddingTop: "0.03em",
          paddingBottom: "0.1em",
        }}
      >
        {highlight}
      </span>
      {after}
    </>
  );
}

export function SwissBackground({
  slide,
  cW,
  cH,
  theme,
  locale,
  appName,
  index,
  total,
  section,
  count: countOverride,
  metrics,
}: {
  slide: Slide;
  cW: number;
  cH: number;
  theme: Theme;
  locale: string;
  appName?: string;
  index?: number;
  total?: number;
  section?: string;
  count?: string;
  metrics?: ReturnType<typeof swissMetrics>;
}) {
  const inverted = !!slide.inverted;
  const fg = inverted ? theme.fgAlt : theme.fg;
  const { w, s, M, col } = metrics ?? swissMetrics(cW, cH);
  const hair = inverted ? "rgba(241,241,241,0.09)" : "rgba(32,32,32,0.085)";
  const lineW = Math.max(1, 1.5 * w);
  const indexY = slide.indexY ?? 92 * s;
  const label = section ?? pickText(slide.label, locale);
  const mono = swissMono(theme, 29 * s, fg);
  const count =
    countOverride ??
    (index !== undefined && total ? `${String(index + 1).padStart(2, "0")} / ${String(total).padStart(2, "0")}` : "");
  return (
    <div style={{ position: "absolute", inset: 0, overflow: "hidden", background: inverted ? theme.bgAlt : theme.bg }}>
      {Array.from({ length: 13 }, (_, i) => (
        <div
          key={i}
          style={{ position: "absolute", top: 0, bottom: 0, left: M + i * col - lineW / 2, width: lineW, background: hair }}
        />
      ))}
      {(slide.rules || []).map((y, i) => (
        <div
          key={`rule-${i}`}
          style={{
            position: "absolute",
            left: M,
            right: M,
            top: y,
            height: lineW,
            background: inverted ? "rgba(241,241,241,0.32)" : "rgba(32,32,32,0.3)",
          }}
        />
      ))}
      <div style={{ position: "absolute", left: M, right: M, top: indexY, display: "flex", ...mono }}>
        <span style={{ width: col * 4 }}>{appName}</span>
        <span style={{ flex: 1, overflow: "hidden" }}>{label}</span>
        <span>{count}</span>
      </div>
      <div style={{ position: "absolute", left: M, right: M, top: indexY + 50 * s, height: 3 * w, background: fg }} />
      {(slide.marks || []).map((corner) => (
        <RegistrationMark
          key={corner}
          x={corner.endsWith("l") ? M : cW - M}
          y={corner.startsWith("t") ? M : cH - M}
          size={46 * s}
          stroke={Math.max(1.5, 2.2 * w)}
          color={fg}
        />
      ))}
    </div>
  );
}

function RegistrationMark({ x, y, size, stroke, color }: { x: number; y: number; size: number; stroke: number; color: string }) {
  const r = size * 0.32;
  return (
    <svg
      width={size}
      height={size}
      viewBox={`0 0 ${size} ${size}`}
      style={{ position: "absolute", left: x - size / 2, top: y - size / 2 }}
    >
      <circle cx={size / 2} cy={size / 2} r={r} fill="none" stroke={color} strokeWidth={stroke} />
      <line x1={0} y1={size / 2} x2={size} y2={size / 2} stroke={color} strokeWidth={stroke} />
      <line x1={size / 2} y1={0} x2={size / 2} y2={size} stroke={color} strokeWidth={stroke} />
    </svg>
  );
}
