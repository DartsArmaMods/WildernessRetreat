class CfgVehicles {
    class House_F;
    class Land_Campfire_F: House_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                distance = 4;
                condition = QUOTE(true);
                statement = "";
                position = "[0, 0, 0]";

                CAMPFIRE_ACTIONS;
            };
        };
        XEH_ENABLED;
    };

    class Land_FirePlace_F: House_F {
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                distance = 4;
                condition = QUOTE(true);
                statement = "";
                position = "[0, 0, 0]";

                CAMPFIRE_ACTIONS;
            };
        };
        XEH_ENABLED;
    };
};