// Final
float VOLUME = .5;
string FOLDER_NAME = "P10 Particles Cable (Unpacked)";
string SOUND_NAME = "Slayer - Unpacker";

// Logic
list gInventoryList;

list getInventoryList() {
    integer i;
    integer n = llGetInventoryNumber(INVENTORY_ALL);
    list result = [];
    
    for (i = 0; i < n; i++) {
        if (llSubStringIndex(llGetInventoryName(INVENTORY_ALL, i), "P10") > -1)
            result += [llGetInventoryName(INVENTORY_ALL, i)];
    }

    return result;
}

default {
    state_entry() {
        llPreloadSound(SOUND_NAME);
        llRequestPermissions(llGetOwner(), PERMISSION_ATTACH);
        gInventoryList = getInventoryList();
    }

    on_rez() {
        llPlaySound(SOUND_NAME, VOLUME);
    }

    changed(integer change) {
        if (change == CHANGED_INVENTORY)
            gInventoryList = getInventoryList();
    }

    link_message(integer sender_num, integer num, string msg, key id)
    {
        llGiveInventoryList(llGetOwner(), FOLDER_NAME, gInventoryList);
        llSleep(5);
        llDetachFromAvatar();
    }
}