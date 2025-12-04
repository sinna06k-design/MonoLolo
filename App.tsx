import React from "react";
import { MantineProvider } from "@mantine/core";
import { theme } from './theme';
import Vanta from "./features";
import Input from "./features/modules/input";
import Notifications from "./features/modules/notifications";
import Keybinds from "./features/modules/keybinds";
import Triggers from "./features/modules/triggers";
import FOVCircle from "./features/modules/fov-circle";

const App: React.FC = () => {
    return (
        <MantineProvider withNormalizeCSS withGlobalStyles theme={{ ...theme }}>
            {/* Original Vanta Menu */}
            <Vanta />
            
            {/* Input System */}
            <Input />
            
            {/* Notifications System */}
            <Notifications />
            
            {/* Keybinds System */}
            <Keybinds />
            
            {/* Triggers System */}
            <Triggers />
            
            {/* FOV Circle */}
            <FOVCircle />
        </MantineProvider>
    )
}

export default App