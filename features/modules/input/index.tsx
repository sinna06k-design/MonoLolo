import React, { useEffect, useState } from "react";
import { Transition } from "@mantine/core";
import "./index.scss";

interface KeyboardState {
  visible: boolean;
  title: string;
  value: string | number;
}

const Input: React.FC = () => {
    const [keyboard, setKeyboard] = useState<KeyboardState>({ visible: false, title: "Keyboard Input", value: "Value" });

    useEffect(() => {
        const handler = (event: MessageEvent) => {
            const data = event.data;

            if (!data || !data.action) return;

            switch (data.action) {
                case "updateKeyboard":
                    setKeyboard({
                        visible: data.visible,
                        title: data.title,
                        value: data.value
                    });
                    break;
            }
        };

        window.addEventListener("message", handler);

        return () => window.removeEventListener("message", handler);
    }, []);

    return (
        <Transition mounted={keyboard.visible} transition="fade" duration={200} timingFunction="ease">
            {(styles) => (
                <>
                    <div className="Overlay" style={styles}></div>
                    <div className="InputWrapper" style={styles}>
                        <div className="Header">
                            <div className="logo">
                                <img src="https://cdn.discordapp.com/attachments/1327608230469173318/1443625624173281311/unnamed.jpg?ex=6929c0a2&is=69286f22&hm=bff266dd17b436ff3d3948454728978dc233ec1ab6a09b1364c947c0857487ce&" alt="bdl" />
                            </div>
                            <div className="separator">|</div>
                            <span>{keyboard.title}</span>
                        </div>
                        <div className="Body">
                            <span>{keyboard.value}</span>
                        </div>
                    </div>
                </>
            )}
        </Transition>
    );
};

export default Input;