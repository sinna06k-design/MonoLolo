import React from "react";
import { isEnvBrowser } from "../../../utils/misc";
import { useNuiEvent } from "../../../utils/useNuiEvent";
import "./index.scss";

interface Notification { 
  id: number; 
  type: "success" | "error" | "info" | "warning" | "CFW" | "VRP" | "ESX" | "spawn" | "toggle_on" | "toggle_off"; 
  title: string; 
  desc: string; 
  duration: number; 
  timestamp: number;
}
let nextId = 0;

const Notifications: React.FC = () => {
  const [list, setList] = React.useState<Notification[]>([]);
  const add = React.useCallback((n: Omit<Notification, "id" | "timestamp">) => { 
    nextId++; 
    setList((prev) => [...prev, { 
      ...n, 
      id: nextId, 
      timestamp: Date.now() 
    }]); 
  }, []);
  const remove = React.useCallback((id: number) => { setList((prev) => prev.filter((n) => n.id !== id)); }, []);

  // Listen for protection system info from Lua
  useNuiEvent("setProtectionSystem", (data: { protection: string }) => {
    add({
      type: "info",
      title: "Protection System",
      desc: `Detected: ${data.protection}`,
      duration: 5000,
    });
  });

  React.useEffect(() => {
    const onMessage = (e: MessageEvent) => {
      const data = e.data;
      if (!data || typeof data !== "object") return;

      if (data.action === "showNotification") {
        add({
          type: data.type || "info",
          title: data.title || "Notification",
          desc: data.desc || "",
          duration: data.duration || 4000,
        });
      }

      if (data.action === "setProtection") {
        add({
          type: "info",
          title: "Protection System",
          desc: `Detected: ${data.protection || "Unknown"}`,
          duration: 5000,
        });
      }
    };

    window.addEventListener("message", onMessage);
    return () => window.removeEventListener("message", onMessage);
  }, [add]);

  React.useEffect(() => {
    if (!isEnvBrowser()) return;

    // qd8 Menu startup notifications
    setTimeout(() => {
      add({ type: "success", title: "qd8 Menu", desc: "You have successfully loaded qd8 Menu, welcome!", duration: 5000 });
    }, 500);
    
    setTimeout(() => {
      add({ type: "info", title: "License", desc: "Your license will never expire, thanks for using qd8 Menu.", duration: 5000 });
    }, 1500);
    
    setTimeout(() => {
      add({ type: "warning", title: "Modules", desc: "Loaded Staff/Developer Modules!", duration: 5000 });
    }, 2500);
    
    setTimeout(() => {
      add({ type: "CFW", title: "CFW", desc: "CFW Exploits loaded successfully!", duration: 4000 });
    }, 3500);
    
         setTimeout(() => {
           add({ type: "VRP", title: "VRP", desc: "VRP Exploits loaded successfully!", duration: 4000 });
         }, 4500);
         
         // Example notifications for testing
         setTimeout(() => {
           add({ type: "toggle_on", title: "Feature Enabled", desc: "NoClip has been activated!", duration: 3000 });
         }, 6000);
         
         setTimeout(() => {
           add({ type: "spawn", title: "Vehicle Spawned", desc: "Adder has been spawned successfully!", duration: 3000 });
         }, 7000);
         
         setTimeout(() => {
           add({ type: "toggle_off", title: "Feature Disabled", desc: "Godmode has been deactivated!", duration: 3000 });
         }, 8000);
  }, [add]);

  return (
    <div className="NotificationsWrapper">
      {list.map((n) => (
        <NotificationItem key={n.id} data={n} onRemove={remove} />
      ))}
    </div>
  );
};

type ItemProps = { data: Notification; onRemove: (id: number) => void; };

const NotificationItem: React.FC<ItemProps> = ({ data, onRemove }) => {
  const ref = React.useRef<HTMLDivElement>(null);
  const autoTimer = React.useRef<number>();
  const fallbackTimer = React.useRef<number>();
  const done = React.useRef(false);

  React.useEffect(() => {
    const el = ref.current;
    if (!el) return;

    requestAnimationFrame(() => {
      el.offsetWidth;
      el.classList.add("enter");
    });

    const startExit = () => {
      if (!el) return;
      el.classList.remove("enter");
      el.classList.add("exit");
      el.addEventListener("transitionend", handleEnd);
      fallbackTimer.current = window.setTimeout(() => {
        if (!done.current) cleanUp();
      }, 600);
    };

    const handleEnd = (e: Event) => {
      if (e.target !== el) return;
      done.current = true;
      cleanUp();
    };

    const cleanUp = () => {
      if (autoTimer.current) clearTimeout(autoTimer.current);
      if (fallbackTimer.current) clearTimeout(fallbackTimer.current);
      el?.removeEventListener("transitionend", handleEnd);
      onRemove(data.id);
    };

    autoTimer.current = window.setTimeout(startExit, data.duration);

    return () => {
      if (autoTimer.current) clearTimeout(autoTimer.current);
      if (fallbackTimer.current) clearTimeout(fallbackTimer.current);
      el?.removeEventListener("transitionend", handleEnd);
    };
  }, [data, onRemove]);

  const getNotificationIcon = (type: string) => {
    switch (type) {
      case 'success': return 'fa-solid fa-check-circle';
      case 'error': return 'fa-solid fa-exclamation-triangle';
      case 'warning': return 'fa-solid fa-exclamation-circle';
      case 'CFW': return 'fa-solid fa-code';
      case 'VRP': return 'fa-solid fa-server';
      case 'ESX': return 'fa-solid fa-database';
      case 'spawn': return 'fa-solid fa-car';
      case 'toggle_on': return 'fa-solid fa-toggle-on';
      case 'toggle_off': return 'fa-solid fa-toggle-off';
      default: return 'fa-solid fa-info-circle';
    }
  };

  return (
    <div ref={ref} id={`notif-${data.id}`} className={`Notification ${data.type}`}>
      <i className={getNotificationIcon(data.type)} />
      <div className="NotificationBorder"></div>
      <div className="NotificationContent">
        <div className="NotificationTitle">{data.title}</div>
        <div className="NotificationDesc">{data.desc}</div>
      </div>
      <div className="NotificationProgress" style={{ animationDuration: `${data.duration}ms` }}></div>
    </div>
  );
};

export default Notifications;