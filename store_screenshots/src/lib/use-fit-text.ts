"use client";
import * as React from "react";

// Measure the browser's actual glyphs, including CJK fallback, tracking and word spaces.
export function useFitText(value: unknown, style: React.CSSProperties | undefined, enabled: boolean) {
  const ref = React.useRef<HTMLDivElement>(null);
  const { fontSize, fontFamily, letterSpacing, wordSpacing } = style || {};
  React.useEffect(() => {
    if (!enabled) return;
    let cancelled = false;
    void document.fonts.ready.then(() => {
      const el = ref.current;
      if (!el || cancelled) return;
      const base = typeof fontSize === "number" ? fontSize : parseFloat(fontSize || "16");
      const available = el.clientWidth;
      for (let size = base; size >= base * 0.4; size -= 1) {
        el.style.fontSize = `${size}px`;
        const computed = getComputedStyle(el);
        const canvas = document.createElement("canvas").getContext("2d")!;
        canvas.font = `${computed.fontWeight} ${size}px ${computed.fontFamily}`;
        canvas.letterSpacing = computed.letterSpacing === "normal" ? "0px" : computed.letterSpacing;
        canvas.wordSpacing = computed.wordSpacing === "normal" ? "0px" : computed.wordSpacing;
        const width = Math.max(...el.innerText.split("\n").map(line => canvas.measureText(line).width));
        if (width <= available - 4) break;
      }
    });
    return () => { cancelled = true; };
  }, [value, fontSize, fontFamily, letterSpacing, wordSpacing, enabled]);
  return ref;
}
