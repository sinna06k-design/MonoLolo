// NUI Communication Utilities

declare global {
  interface Window {
    GetParentResourceName?: () => string;
  }
}

/**
 * Get the parent resource name (for FiveM NUI)
 */
export const GetParentResourceName = (): string => {
  if (window.GetParentResourceName) {
    return window.GetParentResourceName();
  }
  return 'qd8-menu'; // fallback for development
};

/**
 * Send data to Lua backend
 */
export const sendNUIMessage = async (action: string, data: any = {}) => {
  try {
    const response = await fetch(`https://${GetParentResourceName()}/${action}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    });
    return response;
  } catch (error) {
    console.error(`Failed to send NUI message: ${action}`, error);
    return null;
  }
};

/**
 * qd8:Notify equivalent function
 */
export const qd8Notify = (type: string, title: string, desc: string, duration: number = 4000) => {
  // Send to React notification system
  window.postMessage({
    action: 'showNotification',
    type,
    title,
    desc,
    duration
  }, '*');
  
  // Also send to Lua if needed
  sendNUIMessage('notify', { type, title, desc, duration });
};

/**
 * Show/Hide Freecam
 */
export const toggleFreecam = (visible: boolean, weaponIndex: number = 0, vehicleIndex: number = 0) => {
  window.postMessage({
    action: 'displayFreecam',
    visible,
    weaponIndex,
    vehicleIndex
  }, '*');
};

/**
 * Update Freecam weapon
 */
export const updateFreecamWeapon = (index: number) => {
  window.postMessage({
    action: 'updateWeapon',
    index
  }, '*');
};

/**
 * Update Freecam vehicle
 */
export const updateFreecamVehicle = (index: number) => {
  window.postMessage({
    action: 'updateVehicle',
    index
  }, '*');
};

/**
 * Show/Hide FOV Circle
 */
export const toggleFOVCircle = (enabled: boolean, size: number = 100) => {
  window.postMessage({
    action: 'showFOVCircle',
    enabled,
    size
  }, '*');
};

/**
 * Show/Hide Main Menu
 */
export const toggleMainMenu = (visible: boolean, username: string = 'Player') => {
  window.postMessage({
    action: 'showUI',
    visible,
    username
  }, '*');
};

/**
 * Update menu content
 */
export const updateMenu = (menu: any[]) => {
  window.postMessage({
    action: 'updateMenu',
    menu
  }, '*');
};

/**
 * Update menu path
 */
export const updateMenuPath = (path: string[]) => {
  window.postMessage({
    action: 'updatePath',
    path
  }, '*');
};

/**
 * Set protection system
 */
export const setProtectionSystem = (protection: string) => {
  window.postMessage({
    action: 'setProtection',
    protection
  }, '*');
};

/**
 * Close menu
 */
export const closeMenu = () => {
  sendNUIMessage('closeMenu');
};

/**
 * Go back in menu
 */
export const goBack = () => {
  sendNUIMessage('goBack');
};

/**
 * Handle menu selection
 */
export const menuSelect = (item: any) => {
  sendNUIMessage('menuSelect', item);
};

/**
 * Handle freecam action
 */
export const freecamAction = (action: string, data: any) => {
  sendNUIMessage('freecamAction', { action, ...data });
};

/**
 * Trigger exploit/hack
 */
export const triggerExploit = (exploit: string, data: any = {}) => {
  sendNUIMessage('triggerExploit', { exploit, ...data });
};

/**
 * Development helper - simulate Lua messages
 */
export const simulateLuaMessage = (action: string, data: any) => {
  if (process.env.NODE_ENV === 'development') {
    setTimeout(() => {
      window.postMessage({ action, ...data }, '*');
    }, 100);
  }
};

// Development helpers
if (process.env.NODE_ENV === 'development') {
  // Simulate qd8 menu startup
  setTimeout(() => {
    setProtectionSystem('WaveShield');
    toggleMainMenu(false);
  }, 1000);
  
  // Add global helpers for development
  (window as any).qd8 = {
    notify: qd8Notify,
    toggleFreecam,
    toggleFOVCircle,
    toggleMainMenu,
    updateMenu,
    setProtectionSystem,
    simulateLuaMessage
  };
}
