"use client";
import * as React from "react";
import { PHONE_SCREEN } from "@/lib/constants";
import { img } from "@/lib/image-cache";

type FrameProps = {
  src: string;
  alt?: string;
  style?: React.CSSProperties;
  /** When true, hide EmptySlot placeholder (so it doesn't bake into exports). */
  hideEmpty?: boolean;
};

// iPhone — uses pre-measured mockup.png overlay
export function Phone({ src, alt = "", style, hideEmpty }: FrameProps) {
  const resolved = img(src);
  return (
    <div style={{ position: "relative", aspectRatio: "1022 / 2082", ...style }}>
      <img
        src={img("/mockup.png")}
        alt=""
        style={{ display: "block", width: "100%", height: "100%" }}
        draggable={false}
      />
      <div
        style={{
          position: "absolute",
          zIndex: 10,
          overflow: "hidden",
          left: `${PHONE_SCREEN.L}%`,
          top: `${PHONE_SCREEN.T}%`,
          width: `${PHONE_SCREEN.W}%`,
          height: `${PHONE_SCREEN.H}%`,
          borderRadius: `${PHONE_SCREEN.RX}% / ${PHONE_SCREEN.RY}%`,
          background: "#111",
        }}
      >
        {resolved ? (
          <img
            src={resolved}
            alt={alt}
            style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
            draggable={false}
          />
        ) : hideEmpty ? null : (
          <EmptySlot />
        )}
        <div aria-hidden style={{ position: "absolute", left: "36%", top: "1.1%", width: "28%", height: "3.5%", borderRadius: 999, background: "#050505", zIndex: 20 }} />
      </div>
    </div>
  );
}

export function AndroidPhone({ src, alt = "", style, hideEmpty }: FrameProps) {
  const resolved = img(src);
  return (
    <div style={{ position: "relative", aspectRatio: "9 / 19.5", ...style }}>
      <div
        style={{
          width: "100%",
          height: "100%",
          borderRadius: "8% / 4%",
          background: "linear-gradient(160deg, #2a2a2e 0%, #18181b 100%)",
          boxShadow: "inset 0 0 0 1px rgba(255,255,255,0.08), 0 8px 40px rgba(0,0,0,0.55)",
          position: "relative",
          overflow: "hidden",
        }}
      >
        <div
          style={{
            position: "absolute",
            left: "3.5%",
            top: "2%",
            width: "93%",
            height: "96%",
            borderRadius: "5.5% / 2.6%",
            overflow: "hidden",
            background: "#000",
          }}
        >
          {resolved ? (
            <img
              src={resolved}
              alt={alt}
              style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
              draggable={false}
            />
          ) : hideEmpty ? null : (
            <EmptySlot />
          )}
          <div
            style={{
              position: "absolute",
              top: "1.1%",
              left: "50%",
              transform: "translateX(-50%)",
              width: "3.6%",
              aspectRatio: "1",
              borderRadius: "50%",
              background: "radial-gradient(circle at 35% 35%, #2a2d36 0%, #050506 60%)",
              zIndex: 20,
            }}
          />
        </div>
      </div>
    </div>
  );
}

export function AndroidTabletP({ src, alt = "", style, hideEmpty }: FrameProps) {
  const resolved = img(src);
  return (
    <div style={{ position: "relative", aspectRatio: "5 / 8", ...style }}>
      <div
        style={{
          width: "100%",
          height: "100%",
          borderRadius: "4.5% / 2.8%",
          background: "linear-gradient(160deg, #2a2a2e 0%, #18181b 100%)",
          boxShadow: "inset 0 0 0 1px rgba(255,255,255,0.08), 0 8px 48px rgba(0,0,0,0.6)",
          position: "relative",
          overflow: "hidden",
        }}
      >
        <div
          style={{
            position: "absolute",
            top: "1.2%",
            left: "50%",
            transform: "translateX(-50%)",
            width: "1.4%",
            height: "0.88%",
            borderRadius: "50%",
            background: "#0d0d0f",
            zIndex: 20,
          }}
        />
        <div
          style={{
            position: "absolute",
            left: "3.5%",
            top: "2.2%",
            width: "93%",
            height: "95.6%",
            borderRadius: "2.5% / 1.6%",
            overflow: "hidden",
            background: "#000",
          }}
        >
          {resolved ? (
            <img
              src={resolved}
              alt={alt}
              style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
              draggable={false}
            />
          ) : hideEmpty ? null : (
            <EmptySlot />
          )}
        </div>
      </div>
    </div>
  );
}

export function AndroidTabletL({ src, alt = "", style, hideEmpty }: FrameProps) {
  const resolved = img(src);
  return (
    <div style={{ position: "relative", aspectRatio: "8 / 5", ...style }}>
      <div
        style={{
          width: "100%",
          height: "100%",
          borderRadius: "2.8% / 4.5%",
          background: "linear-gradient(160deg, #2a2a2e 0%, #18181b 100%)",
          boxShadow: "inset 0 0 0 1px rgba(255,255,255,0.08), 0 8px 48px rgba(0,0,0,0.6)",
          position: "relative",
          overflow: "hidden",
        }}
      >
        <div
          style={{
            position: "absolute",
            left: "1.2%",
            top: "50%",
            transform: "translateY(-50%)",
            width: "0.88%",
            height: "1.4%",
            borderRadius: "50%",
            background: "#0d0d0f",
            zIndex: 20,
          }}
        />
        <div
          style={{
            position: "absolute",
            left: "2.2%",
            top: "3.5%",
            width: "95.6%",
            height: "93%",
            borderRadius: "1.6% / 2.5%",
            overflow: "hidden",
            background: "#000",
          }}
        >
          {resolved ? (
            <img
              src={resolved}
              alt={alt}
              style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
              draggable={false}
            />
          ) : hideEmpty ? null : (
            <EmptySlot />
          )}
        </div>
      </div>
    </div>
  );
}

export function IPad({ src, alt = "", style, hideEmpty }: FrameProps) {
  const resolved = img(src);
  return (
    <div style={{ position: "relative", aspectRatio: "770 / 1000", ...style }}>
      <div
        style={{
          width: "100%",
          height: "100%",
          borderRadius: "5% / 3.6%",
          background: "linear-gradient(180deg, #2C2C2E 0%, #1C1C1E 100%)",
          position: "relative",
          overflow: "hidden",
          boxShadow: "inset 0 0 0 1px rgba(255,255,255,0.1), 0 8px 40px rgba(0,0,0,0.6)",
        }}
      >
        <div
          style={{
            position: "absolute",
            top: "1.2%",
            left: "50%",
            transform: "translateX(-50%)",
            width: "0.9%",
            height: "0.65%",
            borderRadius: "50%",
            background: "#111113",
            zIndex: 20,
          }}
        />
        <div
          style={{
            position: "absolute",
            left: "4%",
            top: "2.8%",
            width: "92%",
            height: "94.4%",
            borderRadius: "2.2% / 1.6%",
            overflow: "hidden",
            background: "#000",
          }}
        >
          {resolved ? (
            <img
              src={resolved}
              alt={alt}
              style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
              draggable={false}
            />
          ) : hideEmpty ? null : (
            <EmptySlot />
          )}
        </div>
      </div>
    </div>
  );
}

// iPhone Duo geometry from Apple's product bezels: outer 1398 × 2032 screen in a
// 1574 × 2194 frame, inner 2007 × 2853 upright with a 120 px border. The outer
// display has 12 pt corners on the hinge side and 48 pt corners elsewhere.
type DuoGeometry = {
  aspect: string;
  screen: { L: number; T: number; W: number; H: number; R: string };
  frameR: string;
  crease?: boolean;
};

const DUO_OUTER: DuoGeometry = {
  aspect: "1574 / 2194",
  screen: { L: 5.59, T: 3.69, W: 88.82, H: 92.62, R: "2.58% 10.3% 10.3% 2.58% / 1.77% 7.09% 7.09% 1.77%" },
  frameR: "7.9% 14.7% 14.7% 7.9% / 5.65% 10.6% 10.6% 5.65%",
};

const DUO_INNER: DuoGeometry = {
  aspect: "2247 / 3093",
  screen: { L: 5.34, T: 3.88, W: 89.32, H: 92.24, R: "7.17% / 5.05%" },
  frameR: "11.75% / 8.54%",
  crease: true,
};

function DuoFrame({ src, alt = "", style, hideEmpty, geometry }: FrameProps & { geometry: DuoGeometry }) {
  const resolved = img(src);
  const { screen } = geometry;
  return (
    <div style={{ position: "relative", aspectRatio: geometry.aspect, ...style }}>
      <div
        style={{
          position: "absolute",
          inset: 0,
          borderRadius: geometry.frameR,
          background: "linear-gradient(140deg, #F4F3F0 0%, #CFCDC8 30%, #F7F6F3 55%, #BDBBB6 80%, #E9E7E3 100%)",
          boxShadow: "inset 0 0 0 1px rgba(0,0,0,0.12), 0 8px 40px rgba(0,0,0,0.35)",
        }}
      />
      <div style={{ position: "absolute", inset: "1.4% 2%", borderRadius: geometry.frameR, background: "#0B0B0C" }} />
      <div
        style={{
          position: "absolute",
          left: `${screen.L}%`,
          top: `${screen.T}%`,
          width: `${screen.W}%`,
          height: `${screen.H}%`,
          borderRadius: screen.R,
          overflow: "hidden",
          background: "#000",
        }}
      >
        {resolved ? (
          <img
            src={resolved}
            alt={alt}
            style={{ display: "block", width: "100%", height: "100%", objectFit: "cover", objectPosition: "top" }}
            draggable={false}
          />
        ) : hideEmpty ? null : (
          <EmptySlot />
        )}
        {geometry.crease && (
          <div
            style={{
              position: "absolute",
              left: 0,
              right: 0,
              top: "49.6%",
              height: "0.8%",
              background:
                "linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,0.035) 45%, rgba(255,255,255,0.05) 55%, rgba(0,0,0,0) 100%)",
              pointerEvents: "none",
            }}
          />
        )}
      </div>
    </div>
  );
}

export function DuoOuter(props: FrameProps) {
  return <DuoFrame {...props} geometry={DUO_OUTER} />;
}

export function DuoInner(props: FrameProps) {
  return <DuoFrame {...props} geometry={DUO_INNER} />;
}

function EmptySlot() {
  return (
    <div
      style={{
        width: "100%",
        height: "100%",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        color: "rgba(255,255,255,0.4)",
        fontSize: "min(2vw, 14px)",
        background: "linear-gradient(135deg, #1a1a1a 0%, #0a0a0a 100%)",
        textAlign: "center",
        padding: "4%",
      }}
    >
      Drop a screenshot here
    </div>
  );
}
