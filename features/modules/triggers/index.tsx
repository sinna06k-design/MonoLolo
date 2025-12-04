import React, { useEffect, useState } from "react";
import { Transition } from "@mantine/core";
import "./index.scss";

interface TriggerState {
  visible: boolean;
  title: string;
  triggers: TriggerItem[];
}

interface TriggerItem {
  id: string;
  name: string;
  description: string;
  enabled: boolean;
  type: "event" | "condition" | "action";
  icon?: string;
}

const Triggers: React.FC = () => {
    const [triggerState, setTriggerState] = useState<TriggerState>({ 
        visible: false, 
        title: "Triggers Manager", 
        triggers: [] 
    });

    useEffect(() => {
        const handler = (event: MessageEvent) => {
            const data = event.data;

            if (!data || !data.action) return;

            switch (data.action) {
                case "updateTriggers":
                    setTriggerState({
                        visible: data.visible,
                        title: data.title || "Triggers Manager",
                        triggers: data.triggers || []
                    });
                    break;
                case "showTriggers":
                    setTriggerState(prev => ({
                        ...prev,
                        visible: true
                    }));
                    break;
                case "hideTriggers":
                    setTriggerState(prev => ({
                        ...prev,
                        visible: false
                    }));
                    break;
            }
        };

        window.addEventListener("message", handler);

        return () => window.removeEventListener("message", handler);
    }, []);

    const handleTriggerToggle = (triggerId: string) => {
        setTriggerState(prev => ({
            ...prev,
            triggers: prev.triggers.map(trigger => 
                trigger.id === triggerId 
                    ? { ...trigger, enabled: !trigger.enabled }
                    : trigger
            )
        }));
        
        // إرسال التحديث للخادم
        window.postMessage({
            action: "triggerToggled",
            triggerId: triggerId
        }, "*");
    };

    const getTypeIcon = (type: string) => {
        switch (type) {
            case "event":
                return "fa-bolt";
            case "condition":
                return "fa-question-circle";
            case "action":
                return "fa-play";
            default:
                return "fa-cog";
        }
    };

    const getTypeColor = (type: string) => {
        switch (type) {
            case "event":
                return "#ff6b6b";
            case "condition":
                return "#4ecdc4";
            case "action":
                return "#45b7d1";
            default:
                return "#95a5a6";
        }
    };

    return (
        <Transition mounted={triggerState.visible} transition="fade" duration={300} timingFunction="ease">
            {(styles) => (
                <>
                    <div className="TriggersOverlay" style={styles}></div>
                    <div className="TriggersWrapper" style={styles}>
                        <div className="TriggersHeader">
                            <i className="fa-solid fa-bolt" />
                            <span>{triggerState.title}</span>
                            <div className="TriggersCount">
                                {triggerState.triggers.filter(t => t.enabled).length} / {triggerState.triggers.length}
                            </div>
                        </div>
                        
                        <div className="TriggersBody">
                            {triggerState.triggers.length === 0 ? (
                                <div className="NoTriggers">
                                    <i className="fa-solid fa-inbox" />
                                    <span>لا توجد محفزات متاحة</span>
                                </div>
                            ) : (
                                <div className="TriggersList">
                                    {triggerState.triggers.map((trigger) => (
                                        <div 
                                            key={trigger.id} 
                                            className={`TriggerItem ${trigger.enabled ? 'enabled' : 'disabled'}`}
                                            onClick={() => handleTriggerToggle(trigger.id)}
                                        >
                                            <div className="TriggerIcon" style={{ color: getTypeColor(trigger.type) }}>
                                                <i className={`fa-solid ${trigger.icon || getTypeIcon(trigger.type)}`} />
                                            </div>
                                            
                                            <div className="TriggerInfo">
                                                <div className="TriggerName">{trigger.name}</div>
                                                <div className="TriggerDescription">{trigger.description}</div>
                                                <div className="TriggerType" style={{ color: getTypeColor(trigger.type) }}>
                                                    {trigger.type.toUpperCase()}
                                                </div>
                                            </div>
                                            
                                            <div className={`TriggerToggle ${trigger.enabled ? 'on' : 'off'}`}>
                                                <div className="ToggleSwitch"></div>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            )}
                        </div>
                        
                        <div className="TriggersFooter">
                            <div className="TriggerTypes">
                                <div className="TypeLegend">
                                    <span style={{ color: "#ff6b6b" }}>● أحداث</span>
                                    <span style={{ color: "#4ecdc4" }}>● شروط</span>
                                    <span style={{ color: "#45b7d1" }}>● إجراءات</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </>
            )}
        </Transition>
    );
};

export default Triggers;
