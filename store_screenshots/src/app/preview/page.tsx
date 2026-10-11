"use client";
// Read-only overview of a deck: /preview?device=iphone&h=640&from=0&n=4
import * as React from "react";
import { getCanvas, SlideCanvas } from "@/components/editor/slide-canvas";
import { themeById } from "@/lib/constants";
import type { Device, ProjectState } from "@/lib/types";

export default function PreviewPage() {
  const [state, setState] = React.useState<ProjectState | null>(null);
  const [params, setParams] = React.useState<URLSearchParams | null>(null);

  React.useEffect(() => {
    setParams(new URLSearchParams(window.location.search));
    fetch("/api/project")
      .then((r) => r.json())
      .then((data) => setState(data.state));
  }, []);

  if (!state || !params) return <div style={{ padding: 24 }}>Loading…</div>;

  const device = (params.get("device") as Device) || state.device;
  const bare = params.has("bare");
  const height = bare ? getCanvas(device, "portrait").cH : Number(params.get("h") || 640);
  const from = Number(params.get("from") || 0);
  const count = Number(params.get("n") || 99);
  const deck = state.slidesByDevice[device] || [];
  const slides = deck.slice(from, from + count);
  const theme = themeById(state.themeId);
  const { cW, cH } = getCanvas(device, "portrait");
  const targetH = bare ? Number(params.get("height") || cH) : height;
  const targetW = bare ? Number(params.get("width") || cW) : cW * height / cH;
  const scaleX = targetW / cW;
  const scaleY = targetH / cH;

  return (
    <div
      style={
        bare
          ? { display: "flex" }
          : { display: "flex", gap: 24, padding: 24, background: "#d9dbe2", flexWrap: "wrap" }
      }
    >
      {bare && <style>{"nextjs-portal{display:none!important}"}</style>}
      {slides.map((slide, i) => (
        <div
          key={slide.id}
          style={{ width: targetW, height: targetH, overflow: "hidden", borderRadius: bare ? 0 : 12, flex: "none" }}
        >
          <div data-export-slide
            style={{ width: cW, height: cH, transform: `scale(${scaleX}, ${scaleY})`, transformOrigin: "top left" }}>
            <SlideCanvas
              slide={slide}
              device={device}
              orientation="portrait"
              theme={theme}
              locale={params.get("locale") || state.locale}
              appName={state.appName}
              appIcon={state.appIcon}
              hideEmpty
              index={from + i}
              total={deck.length}
            />
          </div>
        </div>
      ))}
    </div>
  );
}
