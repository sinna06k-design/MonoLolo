import React, { useState, useEffect } from 'react';
import './index.scss';

interface FOVCircleProps {
  enabled: boolean;
  size: number;
}

const FOVCircle: React.FC = () => {
  const [isVisible, setIsVisible] = useState(false);
  const [circleSize, setCircleSize] = useState(100);

  useEffect(() => {
    const onMessage = (e: MessageEvent) => {
      const data = e.data;
      if (!data || typeof data !== "object") return;

      if (data.action === "showFOVCircle") {
        setIsVisible(data.enabled);
        if (data.size) {
          setCircleSize(data.size);
        }
      }
    };

    window.addEventListener("message", onMessage);
    return () => window.removeEventListener("message", onMessage);
  }, []);

  if (!isVisible) return null;

  return (
    <div className="FOVCircleWrapper">
      <div 
        className="FOVCircle"
        style={{
          width: `${circleSize}px`,
          height: `${circleSize}px`,
        }}
      >
        <div className="FOVCircleInner" />
        <div className="FOVCircleCrosshair">
          <div className="crosshair-horizontal" />
          <div className="crosshair-vertical" />
        </div>
      </div>
    </div>
  );
};

export default FOVCircle;
