#define CAMPFIRE_ACTIONS \
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
    }
