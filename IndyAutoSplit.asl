state("Indy3d")
{
    int missionNumber : 0x0139C0, 0x168;
    float coordsX : 0x032304, 0x918;
    float coordsY : 0x032304, 0x91C;
    int cutscene : 0x0002B78C, 0x4;
    int isMenuOpen : 0x00014204, 0x0;
    int isGameOpen : 0x0001F1F0, 0x8;
    int isLoading : 0x00013224, 0x0;
    int credits : 0x000415CC, 0x22C;
}

start
{   
    //Coords for the begin of Canyon
    /*if(current.missionNumber == 1 && current.posX <= -0.72 && current.posY >= 1.41){
        return true;
    }*/
    
    if(current.missionNumber == 1){
        return true;
    }
}

split
{   
    print("current level is " + current.missionNumber);
    if(current.missionNumber > old.missionNumber){
        return true; 
    }
    if(current.missionNumber == 17 && current.credits == 26){
        return true;
    }
}

isLoading
{

    //Pause during load screens and Windows-like menus
    if(current.isLoading == 1 || current.isGameOpen == 0){
        return true;
    }
    else{
        return false;
    }

    //Pause during cutscenes and load screens
    /*if(current.cutscene == 1 || current.isLoading == 1){
        return true;
    }
    else{
        return false;
    }*/

    //Pause when Menu is Open
    /*if(current.isLoading == 1 || current.isMenuOpen == 1){
        return true;
    }
    else{
        return false;
    }*/

}
