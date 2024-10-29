class CfgMagazines {
    class CA_Magazine;
    class WRT_marshmallow: CA_Magazine {
        scope = 2;
        author = AUTHOR;

        displayName = CSTRING(marshmallow_displayName);
        descriptionShort = CSTRING(marshmallow_description);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QPATHTOF(data\ui\marshmallow_ui_ca.paa);

        deleteIfEmpty = 0; // Never remove
        count = 100; // How cooked the marshmallow is
        mass = 0.5;

        ace_field_rations_consumeTime = 5;
        ace_field_rations_hungerSatiated = 5;
        ace_field_rations_consumeText = "$ace_field_rations_EatingX";
        ace_isFieldRationItem = 1;
        ace_asItem = 1;
    };
};