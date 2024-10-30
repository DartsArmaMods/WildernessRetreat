class CfgVehicles {
    class House_F;
    class Land_Campfire_F: House_F {
        CAMPFIRE_ACTIONS;
        XEH_ENABLED;
    };

    class Land_FirePlace_F: House_F {
        CAMPFIRE_ACTIONS;
        XEH_ENABLED;
    };

    class Item_Base_F;
    class WRT_marshmallowPack_GH: Item_Base_F {
        scope = 2;
        author = AUTHOR;

        displayName = CSTRING(marshmallowPack_displayName);
        // editorPreview = QPATHTOF(data\ui\editorPreviews\WRT_marshmallowPack.jpg);

        class TransportItems {
            ITEM_XX(WRT_marshmallowPack,1);
        };
    };
};