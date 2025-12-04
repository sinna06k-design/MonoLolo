import React from "react";
import { Transition } from "@mantine/core";
import { isEnvBrowser } from "../utils/misc";
import { fetchNui } from "../utils/fetchNui";
import { Icon } from "@iconify/react";
import "./index.scss";

interface Metadata { key: string; value: string; color?: string }
interface Tab {
    type: string;
    label: string;
    desc?: string;
    categories?: { label: string; tabs: Tab[] }[];
    hazardous?: boolean;
    checked?: boolean;
    locked?: boolean;
    value?: number;
    values?: string[];
    min?: number;
    max?: number;
    step?: number;
    name?: string;
    dead?: boolean;
    vehicle?: boolean;
    isDriver?: boolean;
    metaData?: Metadata[];
    onSelect?: (value: any) => void;
}

const Bdle: React.FC = () => {
    const [visible, setVisible] = React.useState<boolean>(false);
    const rootTabs: Tab[] = [
        {
            type: "subMenu",
            label: "Player",
            categories: [
                {
                    label: "Player",
                    tabs: [{ type: "button", label: "Revive", desc: "This will attempt to revive you." }, { type: "slider", label: "Health", value: 100 }, { type: "slider", label: "Armour", value: 50 }, { type: "scrollable-checkbox", label: "Godmode", checked: true, value: 1, values: ["Safe"] }, { type: "scrollable", label: "Values", value: 1, values: ["Safe"] }, { type: "divider", label: "Movement" }, { type: "slider-checkbox", label: "Noclip", value: 2.5, min: 0.25, max: 5.0, step: 0.25 }]
                },
                {
                    label: "Miscellaneous",
                    tabs: [{ type: "scrollable", label: "Clear Tasks", value: 1, values: ["Primary", "Secondary"] }, { type: "subMenu", label: "Equipment" }]
                },
                {
                    label: "Wardrobe",
                    tabs: [{ type: "scrollable", label: "Outfit", value: 1, values: [ "Random", "Staff", "Police", "Civilian" ] }, { type: "button", label: "Skin Menu" }, { type: "divider", label: "Clothing" }]
                }
            ]
        },
        {
            type: "subMenu",
            label: "Weapon",
            categories: [
                {
                    label: "Loadouts",
                    tabs: [{ type: "subMenu", label: "Primary" }, { type: "subMenu", label: "Secondary" }]
                },
                {
                    label: "Attachments",
                    tabs: [{ type: "subMenu", label: "Scopes" }, { type: "subMenu", label: "Barrels" }]
                }
            ]
        },
        { type: "subMenu", label: "Server", categories: [{ label: "List", tabs: [{ type: "button", label: "Select Everyone" }, { type: "button", label: "Un-Select Everyone" }, { type: "button", label: "Clear Selection" }, { type: "divider", label: "Nearby Players" }, { type: "checkbox", label: "stuntdev - [1]", checked: false, name: "J. Paul", dead: true, metaData: [{ key: "Distance", value: "317.0m" }, { key: "Server ID", value: "1" }, { key: "Health", value: "75", color: "0, 255, 17" }, { key: "Armour", value: "90", color: "0, 132, 255" }, { key: "Weapon", value: "Microsmg" }, { key: "Vehicle", value: "CARNOTFOUND" }, { key: "Alive", value: "Alive" }, { key: "Speed", value: "0.0 km/h" }, { key: "Visible", value: "Yes" }] }, { type: "checkbox", label: "ion - [2]", checked: false, vehicle: true }] }, { label: "Safe", tabs: [{ type: "button", label: "Teleport to Player" }] }] },
        { type: "subMenu", label: "Search", categories: [
            {
                label: "Search",
                tabs: [
                    { type: "button", label: "🔍 Quick Search", desc: "Instantly search and find any menu option" }
                ]
            }
        ]},
        { type: "subMenu", label: "Injection", categories: [
            {
                label: "Core Protection",
                tabs: [
                    { type: "checkbox", label: "Enable Injection", checked: false, desc: "Enable advanced injection system",
                        onSelect: function(checked) {
                            if (checked) {
                                fetchNui("qd8_nui_event", { action: "enableInjection" });
                            } else {
                                fetchNui("qd8_nui_event", { action: "disableInjection" });
                            }
                        }
                    },
                    { type: "checkbox", label: "Bypass Anticheat", checked: true, desc: "Bypass common anticheat systems",
                        onSelect: function(checked) {
                            fetchNui("qd8_nui_event", { action: "toggleBypassAnticheat", checked: checked });
                        }
                    },
                    { type: "checkbox", label: "Memory Protection", checked: true, desc: "Protect cheat memory from detection",
                        onSelect: function(checked) {
                            fetchNui("qd8_nui_event", { action: "toggleMemoryProtection", checked: checked });
                        }
                    },
                    { type: "checkbox", label: "Hardware Spoofing", checked: true, desc: "Spoof hardware identifiers",
                        onSelect: function(checked) {
                            fetchNui("qd8_nui_event", { action: "toggleSpoofHardware", checked: checked });
                        }
                    },
                    { type: "checkbox", label: "Anti-Kick Protection", checked: true, desc: "Prevent automatic kicks",
                        onSelect: function(checked) {
                            fetchNui("qd8_nui_event", { action: "toggleAntiKick", checked: checked });
                        }
                    },
                    { type: "checkbox", label: "Screenshot Bypass", checked: true, desc: "Block screenshot requests",
                        onSelect: function(checked) {
                            fetchNui("qd8_nui_event", { action: "toggleScreenshotBypass", checked: checked });
                        }
                    },
                    { type: "checkbox", label: "Stealth Mode", checked: false, desc: "Maximum stealth and anti-detection",
                        onSelect: function(checked) {
                            if (checked) {
                                fetchNui("qd8_nui_event", { action: "enableStealthMode" });
                            } else {
                                fetchNui("qd8_nui_event", { action: "disableStealthMode" });
                            }
                        }
                    },
                    { type: "info", label: "Hardware Profile", desc: "AMD RX6600 + Intel i5-10400F" },
                    { type: "info", label: "Protection Status", desc: "AMD-optimized injection active" }
                ]
            }
        ]},
        { type: "subMenu", label: "Vehicle" },
        { type: "subMenu", label: "Visual" },
        { type: "subMenu", label: "Triggers", categories: [
            {
                label: "Event Triggers",
                tabs: [
                    { type: "checkbox", label: "Player Death", desc: "Trigger when player dies", checked: false },
                    { type: "checkbox", label: "Vehicle Enter", desc: "Trigger when entering vehicle", checked: true },
                    { type: "checkbox", label: "Weapon Fire", desc: "Trigger when firing weapon", checked: false },
                    { type: "divider", label: "Advanced Events" },
                    { type: "checkbox", label: "Health Low", desc: "Trigger when health below 25%", checked: true },
                    { type: "slider", label: "Health Threshold", value: 25, min: 1, max: 100 }
                ]
            },
            {
                label: "Action Triggers", 
                tabs: [
                    { type: "button", label: "Auto Heal", desc: "Automatically heal when health is low" },
                    { type: "button", label: "Auto Armor", desc: "Automatically restore armor" },
                    { type: "scrollable", label: "Teleport Mode", value: 1, values: ["Disabled", "Safe Zone", "Last Position"] },
                    { type: "divider", label: "Combat Actions" },
                    { type: "checkbox", label: "Auto Reload", desc: "Automatically reload weapons", checked: false },
                    { type: "slider-checkbox", label: "Aimbot FOV", value: 50, min: 10, max: 180, checked: false }
                ]
            },
            {
                label: "Condition Triggers",
                tabs: [
                    { type: "scrollable-checkbox", label: "Time Based", value: 1, values: ["Day", "Night", "Dawn", "Dusk"], checked: true },
                    { type: "checkbox", label: "Weather Trigger", desc: "Activate based on weather", checked: false },
                    { type: "checkbox", label: "Zone Trigger", desc: "Activate in specific zones", checked: true },
                    { type: "button", label: "Configure Zones", desc: "Set up trigger zones" }
                ]
            }
        ]},
        { type: "subMenu", label: "Miscellaneous" },
        { type: "subMenu", label: "Settings" }
    ];
    const [tabs, setTabs] = React.useState<Tab[]>(rootTabs);
    const [selectedIndex, setSelectedIndex] = React.useState<number>(0);
    const [menuStack, setMenuStack] = React.useState<{ tabs: Tab[]; categories: { label: string; tabs: Tab[] }[] | null; categoryIndex: number }[]>([]);
    const [categories, setCategories] = React.useState<{ label: string; tabs: Tab[] }[] | null>(null);
    const [categoryIndex, setCategoryIndex] = React.useState<number>(0);
    const [path, setPath] = React.useState<string[]>(["Main Menu"]);
    const [banner, setBanner] = React.useState<{ link: string, color: string }>({ link: "https://media.discordapp.net/attachments/1278398472717865065/1438523525177671761/5bf432b56bbb4f1fe3f3ec13de542b0d.gif?ex=6929a5ee&is=6928546e&hm=c425004114fbe0e42c3a6caa15678a0d205229ac7bb3d66b429ffc651ba791f5&=", color: "150, 0, 0" });
    const [highlightTop, setHighlightTop] = React.useState("0vw");
    const [highlightHeight, setHighlightHeight] = React.useState("1.5625vw");
    const [userName, setUserName] = React.useState<string>("Synclua");
    const [progressHeight, setProgressHeight] = React.useState("0%");
    const [progressTop, setProgressTop] = React.useState("0%");
    const tabsRef = React.useRef<(HTMLDivElement | null)[]>([]);
    const categoryRefs = React.useRef<(HTMLDivElement | null)[]>([]);
    const [highlightWidth, setHighlightWidth] = React.useState("0px");
    const [highlightLeft, setHighlightLeft] = React.useState("0px");


    if (isEnvBrowser()) {
        React.useEffect(() => {
            setVisible(true);
        }, []);
    }

    React.useLayoutEffect(() => {
        if (!visible || tabs.length === 0) return;

        const el = tabsRef.current[selectedIndex];
        if (el) {
            const { offsetTop, offsetHeight } = el;
            const pxToVw = (px: number) => `${(px / window.innerWidth) * 100}vw`;

            setHighlightTop(pxToVw(offsetTop));
            setHighlightHeight(pxToVw(offsetHeight));
            const scrollParent = el.parentElement;
            if (scrollParent) {
                const parentRect = scrollParent.getBoundingClientRect();
                const elRect = el.getBoundingClientRect();
                const distance =
                    elRect.top < parentRect.top
                        ? parentRect.top - elRect.top
                        : elRect.bottom > parentRect.bottom
                        ? elRect.bottom - parentRect.bottom
                        : 0;

                const behavior = distance > 150 ? "auto" : "smooth";

                el.scrollIntoView({
                    block: "nearest",
                    behavior,
                });
            }
        }
    }, [selectedIndex, tabs, visible]);

    React.useEffect(() => {
        const listener = (e: MessageEvent) => {
            const data = e.data;
            if (!data || typeof data !== "object") return;

            if (data.action === "showUI") {
                setVisible(!!data.visible);
                if (data.visible && data.elements) {
                    setTabs(data.elements || []);
                    if (typeof data.index === "number") {
                        setSelectedIndex(data.index);
                    }
                    if (data.path && Array.isArray(data.path)) {
                        setPath(data.path);
                    } else {
                        setPath(["Home"]);
                    }
                }
                if (!data.visible && typeof data.index === "number") {
                    setSelectedIndex(data.index);
                }
                if (typeof data.username != "undefined") {
                    setUserName(data.username);
                }
            }

            if (data.action === "keydown") {
                if (typeof data.index === "number") {
                    setSelectedIndex(data.index);
                }
            }

            if (data.action === "updateBanner") {
                setBanner((prev) => ({ link: data.bannerLink ?? prev.link, color: data.bannerColor ?? prev.color }));

                if (typeof data.bannerColor !== "undefined") {
                    document.documentElement.style.setProperty("--menu-color", data.bannerColor);
                }
            }

            if (data.action === "updateMenuPosition") {
                const wrapper = document.querySelector('.VWrapper') as HTMLElement;
                if (wrapper) {
                    if (data.positionX) {
                        wrapper.style.left = data.positionX;
                        if (data.positionX === "50vw") {
                            wrapper.style.transform = "translateY(-50%) translateX(-50%)";
                        } else {
                            wrapper.style.transform = "translateY(-50%)";
                        }
                    }
                    if (data.positionY) {
                        wrapper.style.top = data.positionY;
                        if (data.positionY === "50vh") {
                            wrapper.style.transform = wrapper.style.transform.includes("translateX") 
                                ? "translateY(-50%) translateX(-50%)" 
                                : "translateY(-50%)";
                        } else {
                            wrapper.style.transform = wrapper.style.transform.replace("translateY(-50%)", "");
                        }
                    }
                }
            }

            if (data.action === "updateMenuPositionManual") {
                const wrapper = document.querySelector('.VWrapper') as HTMLElement;
                if (wrapper) {
                    wrapper.style.left = data.positionX;
                    wrapper.style.top = data.positionY;
                    wrapper.style.transform = "translateY(-50%)";
                    wrapper.style.transition = "left 0.1s ease, top 0.1s ease";
                }
            }

            if (data.action === "startPositioningMode") {
                // Disable menu interaction completely
                const menuWrapper = document.querySelector('.VWrapper') as HTMLElement;
                if (menuWrapper) {
                    menuWrapper.style.pointerEvents = 'none';
                    menuWrapper.style.opacity = '0.7';
                }
                
                // Add visual indicator for positioning mode
                const body = document.body;
                const overlay = document.createElement('div');
                overlay.id = 'positioning-overlay';
                overlay.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100vw;
                    height: 100vh;
                    background: rgba(0, 0, 0, 0.5);
                    z-index: 9998;
                    pointer-events: none;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    color: white;
                    font-size: 1.5vw;
                    font-family: "Inter", sans-serif;
                    font-weight: bold;
                `;
                overlay.innerHTML = '🎯 POSITIONING MODE - Menu Locked | Use Arrow Keys | Enter to Save';
                body.appendChild(overlay);
            }

            if (data.action === "stopPositioningMode") {
                // Re-enable menu interaction
                const menuWrapper = document.querySelector('.VWrapper') as HTMLElement;
                if (menuWrapper) {
                    menuWrapper.style.pointerEvents = 'auto';
                    menuWrapper.style.opacity = '1';
                }
                
                // Remove positioning mode overlay
                const overlay = document.getElementById('positioning-overlay');
                if (overlay) {
                    overlay.remove();
                }
            }

            if (data.action === "showFOVCircle") {
                const body = document.body;
                let fovCircle = document.getElementById('fov-circle');
                
                console.log("FOV Circle Event - Enabled:", data.enabled, "Size:", data.size); // Debug
                
                if (data.enabled) {
                    // Remove existing circle first
                    if (fovCircle) {
                        fovCircle.remove();
                    }
                    
                    // Create new FOV circle
                    fovCircle = document.createElement('div');
                    fovCircle.id = 'fov-circle';
                    const size = data.size || 100;
                    fovCircle.style.cssText = `
                        position: fixed !important;
                        top: 50% !important;
                        left: 50% !important;
                        width: ${size * 2}px !important;
                        height: ${size * 2}px !important;
                        border: 4px solid rgba(152, 45, 234, 0.9) !important;
                        border-radius: 50% !important;
                        transform: translate(-50%, -50%) !important;
                        pointer-events: none !important;
                        z-index: 99999 !important;
                        box-shadow: 0 0 20px rgba(152, 45, 234, 0.6) !important;
                        transition: width 0.3s ease, height 0.3s ease !important;
                        display: block !important;
                    `;
                    body.appendChild(fovCircle);
                    console.log("FOV Circle created with size:", size * 2); // Debug
                } else {
                    // Remove FOV circle
                    if (fovCircle) {
                        fovCircle.remove();
                        console.log("FOV Circle removed"); // Debug
                    }
                }
            }

            if (data.action === "updateFOVSize") {
                let fovCircle = document.getElementById('fov-circle');
                const size = data.size || 100;
                
                console.log("Update FOV Size:", size, "Circle exists:", !!fovCircle); // Debug
                
                if (fovCircle) {
                    // Update existing circle with animation
                    fovCircle.style.width = `${size * 2}px`;
                    fovCircle.style.height = `${size * 2}px`;
                    console.log("Updated FOV circle to size:", size * 2); // Debug
                } else {
                    // Create circle for preview (temporary)
                    const body = document.body;
                    fovCircle = document.createElement('div');
                    fovCircle.id = 'fov-circle';
                    fovCircle.style.cssText = `
                        position: fixed !important;
                        top: 50% !important;
                        left: 50% !important;
                        width: ${size * 2}px !important;
                        height: ${size * 2}px !important;
                        border: 4px solid rgba(152, 45, 234, 0.9) !important;
                        border-radius: 50% !important;
                        transform: translate(-50%, -50%) !important;
                        pointer-events: none !important;
                        z-index: 99999 !important;
                        box-shadow: 0 0 20px rgba(152, 45, 234, 0.6) !important;
                        transition: width 0.3s ease, height 0.3s ease !important;
                        display: block !important;
                        opacity: 0.8 !important;
                    `;
                    body.appendChild(fovCircle);
                    console.log("Created preview FOV circle with size:", size * 2); // Debug
                    
                    // Auto-hide preview after 2 seconds
                    setTimeout(() => {
                        const previewCircle = document.getElementById('fov-circle');
                        if (previewCircle && previewCircle.style.opacity === '0.8') {
                            previewCircle.remove();
                            console.log("Removed preview FOV circle"); // Debug
                        }
                    }, 2000);
                }
            }

            if (data.action === "updateElements") {
                setTabs(data.elements || []);
                if (typeof data.index === "number") {
                    setSelectedIndex(data.index);
                } else {
                    setSelectedIndex(0);
                }
                if (data.categories) {
                    setCategories(data.categories);
                    setCategoryIndex(data.categoryIndex || 0);
                } else {
                    setCategories(null);
                    setCategoryIndex(0);
                }
                if (data.path && Array.isArray(data.path)) {
                    setPath(data.path);
                }
            }
        };

        window.addEventListener("message", listener);
        return () => window.removeEventListener("message", listener);
    }, []);

    React.useEffect(() => {
        if (tabs.length === 0) return;

        const visibleCount = Math.floor(14.0625 / 1.5625);
        const total = tabs.filter(tab => tab.type !== "divider").length;
        const selected = tabs.filter(tab => tab.type !== "divider").indexOf(tabs[selectedIndex]);

        if (total <= visibleCount) {
            setProgressHeight("97%");
            setProgressTop("0%");
        } else {
            const heightPercent = (visibleCount / total) * 100;
            const topPercent = (selected / total) * (100 - heightPercent);

            setProgressHeight(`${heightPercent}%`);
            setProgressTop(`${topPercent}%`);
        }
    }, [tabs, selectedIndex]);

    React.useEffect(() => {
        if (categories && categoryRefs.current[categoryIndex]) {
            const currentCategory = categoryRefs.current[categoryIndex];
            if (currentCategory) {
                const categoryWidth = currentCategory.offsetWidth;
                const categoryLeft = currentCategory.offsetLeft;

                setHighlightWidth(`${categoryWidth}px`);
                setHighlightLeft(`${categoryLeft}px`);
            }
        }
    }, [categories, categoryIndex]);

    React.useEffect(() => {
        const handleKeyDown = (e: KeyboardEvent) => {
            if (!visible) return;

            switch (e.key) {
                case "ArrowUp":
                    setSelectedIndex((prev) => (prev - 1 + tabs.length) % tabs.length);
                    break;
                case "ArrowDown":
                    setSelectedIndex((prev) => (prev + 1) % tabs.length);
                    break;
                case "Enter": {
                    const current = tabs[selectedIndex];
                    if (current?.categories) {
                        setMenuStack((prev) => [ ...prev, { tabs, categories, categoryIndex } ]);
                        setCategories(current.categories);
                        setCategoryIndex(0);
                        setTabs(current.categories[0].tabs);
                        setSelectedIndex(0);
                    }
                    break;
                }
                case "Backspace": {
                    if (menuStack.length > 0) {
                        const last = menuStack[menuStack.length - 1];
                        setMenuStack((prev) => prev.slice(0, -1));
                        setTabs(last.tabs);
                        setCategories(last.categories);
                        setCategoryIndex(last.categoryIndex);
                        setSelectedIndex(0);
                    }
                    break;
                }
                case "q":
                case "ArrowLeft": {
                    if (categories) {
                        const newIndex = (categoryIndex - 1 + categories.length) % categories.length;
                        setCategoryIndex(newIndex);
                        setTabs(categories[newIndex].tabs);
                        setSelectedIndex(0);
                    }
                    break;
                }
                case "e":
                case "ArrowRight": {
                    if (categories) {
                        const newIndex = (categoryIndex + 1) % categories.length;
                        setCategoryIndex(newIndex);
                        setTabs(categories[newIndex].tabs);
                        setSelectedIndex(0);
                    }
                    break;
                }
            }
        };

        window.addEventListener("keydown", handleKeyDown);
        return () => window.removeEventListener("keydown", handleKeyDown);
    }, [tabs, selectedIndex, categories, categoryIndex, menuStack, visible]);

    return (
        <>
            <Transition mounted={visible} transition="fade" duration={300} timingFunction="ease">
                {(styles) => (
                    <div className="VWrapper" style={styles}>
                        <div className="VLeftElements">
                            <div className="VBanner">
                                <img src={banner.link} draggable="false" />
                            </div>
                            <div className="VLeftInnerElements">
                                <div className="VScroll">
                                    <div className="VSProgress" style={{ height: progressHeight, top: progressTop }}></div>
                                </div>
                                {categories ? (
                                    <div className="PCategories" style={{ position: "relative" }}>
                                        <div
                                            className="PCategoryHighlight"
                                            style={{
                                                left: highlightLeft,
                                                top: 0,
                                                width: highlightWidth,
                                                height: "100%",
                                                transition: "left 200ms ease, width 200ms ease",
                                                background: `rgb(${banner.color})`,
                                                position: "absolute",
                                                borderRadius: ".2604vw",
                                                zIndex: 0,
                                                pointerEvents: "none",
                                            }}
                                        />
                                        {categories.map((cat, i) => (
                                            <div key={i} className={`PCategory ${i === categoryIndex ? "active" : ""}`} ref={(el) => (categoryRefs.current[i] = el)}>
                                                <span>{cat.label}</span>
                                            </div>
                                        ))}
                                    </div>
                                ) : (
                                <div className="VHeader">
                                        <span className="Path">
                                            {categories ? path.join(" | ") : "Main Menu"}
                                        </span>
                                        <span className="Name">qd8 | discord.gg/NotNow</span>
                                </div>
                                )}
                                <div className="VTabs">
                                    <div
                                        style={{
                                            position: "absolute",
                                            width: "100%",
                                            top: highlightTop,
                                            height: highlightHeight,
                                            backgroundColor: `rgba(${banner.color}, 0.60)`,
                                            zIndex: 0,
                                            transition: "top 200ms ease, height 120ms ease",
                                            pointerEvents: "none"
                                        }}
                                    />
                                    {tabs.map((tab, i) => (
                                        <div key={i} className={`VTab ${i === selectedIndex ? "Selected" : ""}`} ref={(el) => (tabsRef.current[i] = el)}>
                                            {tab.type != "divider" && (<span className="VTLabel">{selectedIndex === i && tab.type == "slider" ? `${tab.label}: ${tab.value}` : selectedIndex === i && tab.type == "slider-checkbox" ? `${tab.label}: ${tab.value}` : tab.label}{tab.hazardous && (<span style={{ color: "#fcb603" }}>&nbsp;*</span>)}</span>)}
                                            {tab.type == "subMenu" && (
                                                <Icon className="Icon" icon="uim:angle-double-right" />
                                            )}
                                            {tab.type === "checkbox" && (
                                                <div className={`Checkbox ${tab.checked ? "Checked" : ""}`}>
                                                    <div className="Inside"></div>
                                                </div>
                                            )}
                                            {tab.type === "slider" && (
                                                <div className="Slider">
                                                    <div className="Progress" style={{ width: `${ tab.max && tab.min !== undefined ? ((tab.value! - tab.min) / (tab.max - tab.min)) * 100 : tab.value}%` }}>
                                                        <div className="Thumb"></div>
                                                    </div>
                                                </div>
                                            )}
                                            {tab.type === "slider-checkbox" && (
                                                <div className="VOptions">
                                                    <div className="Slider">
                                                        <div className="Progress" style={{ width: `${ tab.max && tab.min !== undefined ? ((tab.value! - tab.min) / (tab.max - tab.min)) * 100 : tab.value}%`, transition: "0.5s width" }}>
                                                            <div className="Thumb"></div>
                                                        </div>
                                                    </div>
                                                    <div className={`Checkbox ${tab.checked ? "Checked" : ""}`}>
                                                        <div className="Inside"></div>
                                                    </div>
                                                </div>
                                            )}
                                            {tab.type === "scrollable-checkbox" && (
                                                <div className="VOptions">
                                                    <div className="Scrollable">
                                                        <span>-</span>
                                                        <span>{tab.values && tab.value ? tab.values[tab.value - 1] : ""}</span>
                                                        <span>-</span>
                                                    </div>
                                                    <div className={`Checkbox ${tab.checked ? "Checked" : ""}`}>
                                                        <div className="Inside"></div>
                                                    </div>
                                                </div>
                                            )}
                                            {tab.type === "scrollable" && (
                                                <div className="Scrollable">
                                                    <span>-</span>
                                                    <span>{tab.values && tab.value ? tab.values[tab.value - 1] : ""}</span>
                                                    <span>-</span>
                                                </div>
                                            )}
                                            {tab.type === "divider" && (
                                                <div className="Divider">
                                                    <div className="Left"></div>
                                                    <span className="Label"><span style={{ color: `rgb(${banner.color})` }}>[</span>{tab.label}<span style={{ color: `rgb(${banner.color})` }}>]</span></span>
                                                    <div className="Right"></div>
                                                </div>
                                            )}
                                        </div>
                                    ))}
                                </div>
                                <div className="VFooter">
                                    <div className="footer-logo">
                                        <img src="https://cdn.discordapp.com/attachments/1327608230469173318/1443625624173281311/unnamed.jpg?ex=6929c0a2&is=69286f22&hm=bff266dd17b436ff3d3948454728978dc233ec1ab6a09b1364c947c0857487ce&" alt="qd8 Logo" />
                                        <span className="qd8-text">@.qd8</span>
                                    </div>
                                    <span className="Indicator">
                                        ({tabs.filter(tab => tab.type !== "divider").indexOf(tabs[selectedIndex]) + 1}/
                                        {tabs.filter(tab => tab.type !== "divider").length})
                                    </span>
                                </div>
                            </div>
                            <Transition mounted={visible && (!tabs[selectedIndex].metaData) && (tabs[selectedIndex].type != "subMenu" && tabs[selectedIndex].type != "divider" && tabs[selectedIndex].type != "slider" && tabs[selectedIndex].type != "scrollable")} transition="pop" duration={25} timingFunction="ease">
                                {(dStyles) => (
                                    <div className="VDesc" style={dStyles}>
                                        <span>{tabs[selectedIndex].desc}</span>
                                        {(tabs[selectedIndex].type == "button" || tabs[selectedIndex].type == "checkbox" || tabs[selectedIndex].type == "scrollable-checkbox" || tabs[selectedIndex].type == "slider-checkbox") && (<span style={{ marginLeft: "12.65vw" }}>Press F5 to Bind</span>)}
                                    </div>
                                )}
                            </Transition>
                        </div>
                        <div className="VRightElements">
                            <Transition mounted={tabs[selectedIndex] && tabs[selectedIndex].metaData && tabs[selectedIndex].metaData?.length > 0 || false} transition="fade" duration={0} timingFunction="ease">
                                {(metadataStyles) => (
                                    <div className="Metadata" style={metadataStyles}>
                                        <div className="Title">
                                            <span>{tabs[selectedIndex].name}</span>
                                        </div>
                                        <div className="Line"></div>
                                        <div className="Values">
                                            {tabs[selectedIndex] && tabs[selectedIndex].metaData && tabs[selectedIndex].metaData?.map((val, i) => (
                                                <div className="Value">
                                                    <div className="Key">{val.key}</div>
                                                    <div className="Val">
                                                        <span style={{ color: val.key == "Weapon" ? "#D82325" : "" }}>{val.value}</span>
                                                        {(val.key == "Health" || val.key == "Armour") && (<div className="Status" style={{ backgroundColor: `rgba(${val.color}, 0.25)` }}>
                                                            <div className="Progress" style={{ height: `${parseInt(val.value)}%`, backgroundColor: `rgb(${val.color})` }}></div>
                                                        </div>)}
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                )}
                            </Transition>
                        </div>
                    </div>
                )}
            </Transition>
        </>
    );
};

export default Bdle;