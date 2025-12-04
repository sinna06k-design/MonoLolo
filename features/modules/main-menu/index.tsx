import React, { useState, useEffect } from 'react';
import './index.scss';

interface MenuState {
  visible: boolean;
  username: string;
  currentPath: string[];
  protection: string;
}

interface MenuItem {
  type: string;
  label: string;
  icon?: string;
  desc?: string;
  checked?: boolean;
  value?: any;
  onSelect?: () => void;
  categories?: MenuCategory[];
  tabs?: MenuItem[];
}

interface MenuCategory {
  label: string;
  tabs: MenuItem[];
}

const stripBrackets = (text: string) => text.replace(/[\[\]]/g, '').trim();

const MainMenu: React.FC = () => {
  const [state, setState] = useState<MenuState>({
    visible: false,
    username: 'Player',
    currentPath: ['Main Menu'],
    protection: 'Unknown'
  });

  const [currentMenu, setCurrentMenu] = useState<MenuItem[]>([]);
  const [selectedIndex, setSelectedIndex] = useState(0);

  useEffect(() => {
    const onMessage = (e: MessageEvent) => {
      const data = e.data;
      if (!data || typeof data !== "object") return;

      if (data.action === "showUI") {
        setState(prev => ({
          ...prev,
          visible: data.visible,
          username: data.username || 'Player'
        }));
      }

      if (data.action === "updateMenu") {
        setCurrentMenu(data.menu || []);
        setSelectedIndex(0);
      }

      if (data.action === "updatePath") {
        setState(prev => ({
          ...prev,
          currentPath: data.path || ['Main Menu']
        }));
      }

      if (data.action === "setProtection") {
        setState(prev => ({
          ...prev,
          protection: data.protection || 'Unknown'
        }));
      }
    };

    window.addEventListener("message", onMessage);
    return () => window.removeEventListener("message", onMessage);
  }, []);

  // Keyboard navigation
  useEffect(() => {
    if (!state.visible) return;

    const handleKeyDown = (event: KeyboardEvent) => {
      switch (event.key) {
        case 'ArrowUp':
          event.preventDefault();
          setSelectedIndex(prev => 
            prev > 0 ? prev - 1 : currentMenu.length - 1
          );
          break;
        case 'ArrowDown':
          event.preventDefault();
          setSelectedIndex(prev => 
            prev < currentMenu.length - 1 ? prev + 1 : 0
          );
          break;
        case 'Enter':
          event.preventDefault();
          handleItemSelect(currentMenu[selectedIndex]);
          break;
        case 'Escape':
          event.preventDefault();
          closeMenu();
          break;
        case 'Backspace':
          event.preventDefault();
          goBack();
          break;
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [state.visible, currentMenu, selectedIndex]);

  const handleItemSelect = (item: MenuItem) => {
    if (!item) return;

    // Send selection to Lua
    fetch(`https://${GetParentResourceName()}/menuSelect`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        type: item.type,
        label: item.label,
        value: item.value,
        checked: item.checked
      })
    });

    if (item.onSelect) {
      item.onSelect();
    }
  };

  const closeMenu = () => {
    setState(prev => ({ ...prev, visible: false }));
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({})
    });
  };

  const goBack = () => {
    fetch(`https://${GetParentResourceName()}/goBack`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({})
    });
  };

  if (!state.visible) return null;

  return (
    <div className="main-menu-overlay">
      <div className="main-menu-container">
        {/* Header */}
        <div className="menu-header">
          <div className="menu-title">
            <div className="title-icon">
              <img src="https://cdn.discordapp.com/attachments/1327608230469173318/1443625624173281311/unnamed.jpg?ex=6929c0a2&is=69286f22&hm=bff266dd17b436ff3d3948454728978dc233ec1ab6a09b1364c947c0857487ce&" alt="qd8 Logo" onError={(e) => {
                e.currentTarget.style.display = 'none';
                e.currentTarget.nextElementSibling!.style.display = 'inline-block';
              }} />
              <i className="fa-solid fa-terminal" style={{display: 'none'}}></i>
            </div>
            <div className="title-text">
              <span className="main-title">qd8 Menu</span>
              <span className="sub-title">Advanced FiveM Menu</span>
            </div>
          </div>
          <div className="menu-info">
            <div className="user-info">
              <i className="fa-solid fa-user"></i>
              <span>{state.username}</span>
            </div>
            <div className="protection-info">
              <i className="fa-solid fa-shield-halved"></i>
              <span>{state.protection}</span>
            </div>
          </div>
        </div>

        {/* Breadcrumb */}
        <div className="menu-breadcrumb">
          <div className="breadcrumb-path">
            {state.currentPath.map((path, index) => (
              <React.Fragment key={index}>
                <span className="path-item">{stripBrackets(path)}</span>
                {index < state.currentPath.length - 1 && (
                  <i className="fa-solid fa-chevron-right path-separator"></i>
                )}
              </React.Fragment>
            ))}
          </div>
          <div className="breadcrumb-controls">
            <button className="control-btn" onClick={goBack}>
              <i className="fa-solid fa-arrow-left"></i>
              <span>Back</span>
            </button>
            <button className="control-btn" onClick={closeMenu}>
              <i className="fa-solid fa-xmark"></i>
              <span>Close</span>
            </button>
          </div>
        </div>

        {/* Menu Content */}
        <div className="menu-content">
          <div className="menu-list">
            {currentMenu.map((item, index) => (
              <div
                key={index}
                className={`menu-item ${item.type} ${selectedIndex === index ? 'selected' : ''} ${item.checked ? 'checked' : ''}`}
                onClick={() => {
                  setSelectedIndex(index);
                  handleItemSelect(item);
                }}
              >
                <div className="item-icon">
                  {item.icon ? (
                    <i className={item.icon}></i>
                  ) : (
                    <i className={getDefaultIcon(item.type)}></i>
                  )}
                </div>
                <div className="item-content">
                  <div className="item-label">{stripBrackets(item.label)}</div>
                  {item.desc && (
                    <div className="item-desc">{item.desc}</div>
                  )}
                </div>
                <div className="item-controls">
                  {item.type === 'checkbox' && (
                    <div className={`checkbox ${item.checked ? 'checked' : ''}`}>
                      <i className="fa-solid fa-check"></i>
                    </div>
                  )}
                  {item.type === 'slider' && (
                    <div className="slider-value">{item.value}</div>
                  )}
                  {(item.type === 'subMenu' || item.categories || item.tabs) && (
                    <i className="fa-solid fa-chevron-right"></i>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Footer */}
        <div className="menu-footer">
          <div className="footer-controls">
            <div className="control-hint">
              <span className="key">↑↓</span>
              <span>Navigate</span>
            </div>
            <div className="control-hint">
              <span className="key">Enter</span>
              <span>Select</span>
            </div>
            <div className="control-hint">
              <span className="key">Backspace</span>
              <span>Back</span>
            </div>
            <div className="control-hint">
              <span className="key">ESC</span>
              <span>Close</span>
            </div>
          </div>
          <div className="footer-info">
            <span>qd8 Menu v2.0 - discord.gg/nww</span>
          </div>
        </div>
      </div>
    </div>
  );
};

const getDefaultIcon = (type: string): string => {
  switch (type) {
    case 'button': return 'fa-solid fa-play';
    case 'checkbox': return 'fa-solid fa-check-square';
    case 'slider': return 'fa-solid fa-sliders';
    case 'subMenu': return 'fa-solid fa-folder';
    case 'input': return 'fa-solid fa-keyboard';
    default: return 'fa-solid fa-circle';
  }
};

export default MainMenu;
