state("Indy3d") {
    int missionNumber : 0x0139C0, 0x168;
    float coordsX : 0x032304, 0x918;
    float coordsY : 0x032304, 0x91C;
    int cutscene : 0x0002B78C, 0x4;
    int isMenuOpen : 0x00014204, 0x0;
    int isGameOpen : 0x0001F1F0, 0x8;
    int isLoading : 0x00013224, 0x0;
    int credits : 0x000415CC, 0x22C;
    int treasureCounter : 0x00016A94, 0x4;
}

startup {
	settings.Add("all_treasures", false, "All Treasures splitting");
	settings.SetToolTip("all_treasures", "Enabling this option will split on every treasure pick-up.");
}

start {   
    // Start when the game switches to level 1 AND when the starting cutscene starts
	// (prevents early start of the timer for RTA after you click the Start New Game button but before
	//  the level starts playing)
    if (current.missionNumber == 1 && current.cutscene > old.cutscene) {
        return true;
    }
	
	//Coords for the begin of Canyon
    /*if (current.missionNumber == 1 && current.posX <= -0.72 && current.posY >= 1.41) {
        return true;
    }*/
}

split {   
    //Split by level
    if (current.missionNumber > old.missionNumber) {
        return true; 
    }
	
	//Split by treasure
    if (settings["all_treasures"] && current.treasureCounter > old.treasureCounter){
        return true;
    }
	
	// Last split at the end of Peru
    if (current.missionNumber == 17 && current.credits != 0) {
        return true;
    }
}

isLoading {

    //Pause during load screens and Windows-like menus
	//Preferred setting by the_kovic
    if (current.isLoading == 1 || current.isGameOpen == 0) {
        return true;
    }
    else {
        return false;
    }

	// ---------------
	// ALTERNATIVES
	// ---------------
	
	//Pause during load screens
    /*if (current.isLoading == 1) {
        return true;
    }
    else {
        return false;
    }*/

    //Pause during cutscenes and load screens
    /*if (current.cutscene == 1 || current.isLoading == 1) {
        return true;
    }
    else {
        return false;
    }*/

    //Pause when Menu is Open
    /*if (current.isLoading == 1 || current.isMenuOpen == 1) {
        return true;
    }
    else {
        return false;
    }*/
}
