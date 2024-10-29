class CfgWeapons {
    class CBA_MiscItem;
    class WRT_ItemCore: CBA_MiscItem {
        class ItemInfo;
    };
    class WRT_marshmallowPack: WRT_ItemCore {
        scope = 2;
        author = AUTHOR;

        displayName = CSTRING(marshmallowPack_displayName);
        descriptionShort = CSTRING(marshmallowPack_description);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QPATHTOF(data\ui\marshmallowPack_ui_ca.paa);

        class ItemInfo: ItemInfo {
            mass = 3;
        };
    };
};