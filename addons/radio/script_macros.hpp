// Class name, displayName, music class (category), duration
#define MUSIC(var1,var2,var3,var4) \
    class TRIPLES(WRT,var3,var1) { \
        name = var2; \
        sound[] = {QPATHTOF(music\var3\var1##.ogg), "db+0", 1}; \
        duration = var4; \
        musicClass = QUOTE(DOUBLES(WRT,var3)); \
    }

// Class name, displayName, music class (category)
// Format is like this to stay consistent with MUSIC macro
#define SOUND(var1,var2,var3) \
    class TRIPLES(WRT,var3,var1) { \
        name = var2; \
        sound[] = {QPATHTOF(music\var3\var1##.ogg), "db+0", 1}; \
        titles[] = {0, ""}; \
    }