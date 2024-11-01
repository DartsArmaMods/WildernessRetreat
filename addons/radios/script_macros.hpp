// Class name, displayName, music class (category), duration
#define MUSIC(var1,var2,var3,var4) \
    class TRIPLES(WRT,var3,var1) { \
        name = var2; \
        sound[] = {QPATHTOF(music\var3\var1##.ogg), "db+0", 1}; \
        duration = var4; \
        musicClass = QUOTE(DOUBLES(WRT,var3)); \
    }

// Class name, displayName, music class (category)
// See https://community.bistudio.com/wiki/CfgSFX
#define SOUND_FX(var1,var2,var3) \
    class TRIPLES(WRT,var3,var1) { \
        name = var2; \
        sounds[] = {"sound0"}; \
        sound0[] = {QPATHTOF(music\var3\var1##.ogg), "db+0", 1, 200, 1, 0, 1, 2}; \
        empty[] = {"", 0, 0, 0, 0, 0, 0, 0}; \
    }

// Class name, displayName, music class (category)
#define SOUND_OBJ(var1,var2,var3) \
    class TRIPLES(WRT,var3,var1): Sound { \
        scope = 2; \
        author = AUTHOR; \
        displayName = var2; \
        sound = QUOTE(TRIPLES(WRT,var3,var1)); \
    }

#define RADIO_ACTIONS \
    class ACE_Actions { \
        class ACE_MainActions { \
            displayName = "$STR_ace_interaction_MainAction"; \
            distance = 4; \
            condition = QUOTE(true); \
            statement = ""; \
            position = "[0, 0, 0]"; \
            class GVAR(playMusic) { \
                displayName = CSTRING(playMusic); \
                condition = QUOTE(true); \
                statement = ""; \
                icon = "\a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa"; \
                insertChildren = QUOTE(call FUNC(playMusic_insertChildren)); \
            }; \
            class GVAR(stopMusic) { \
                displayName = CSTRING(stopMusic); \
                condition = QUOTE(!isNull (_target getVariable [ARR_2(QQGVAR(soundSource),objNull)])); \
                statement = QUOTE(call FUNC(stopMusic)); \
                icon = "\a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_off_ca.paa"; \
            }; \
        }; \
    }