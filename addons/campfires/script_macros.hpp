#define MARSHMALLOW "WRT_marshmallow"

#define CAMPFIRE_ACTIONS \
    class ACE_Actions { \
        class ACE_MainActions { \
            displayName = "$STR_ace_interaction_MainAction"; \
            distance = 4; \
            condition = QUOTE(true); \
            statement = ""; \
            position = "[0, 0, 0]"; \
            class GVAR(light) { \
                displayName = "$STR_action_fire_inflame"; \
                condition = QUOTE(!inflamed (_this select 0)); \
                statement = QUOTE((_this select 0) inflame true); \
                icon = ""; \
            }; \
            class GVAR(putOut) { \
                displayName = "$STR_action_fire_put_down"; \
                condition = QUOTE(inflamed (_this select 0)); \
                statement = QUOTE((_this select 0) inflame false); \
                icon = ""; \
            }; \
            class GVAR(roastMarshmallow) { \
                displayName = CSTRING(roastMarshmallow); \
                condition = QUOTE(call FUNC(canRoastMarshmallow)); \
                statement = QUOTE(call FUNC(roastMarshmallow)); \
                icon = QPATHTOF(data\ui\marshmallow_ui_ca.paa); \
            }; \
        }; \
    }