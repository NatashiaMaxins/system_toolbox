# This is a little AWK program that interprets MegaCLI output
    /Enclosure Device ID/ { counter += 1; ENC[counter] = $4 }
    /Slot Number/ { slot[counter] = $3 }
    /Media Error Count/ { MD_error[counter] = $4 }
    /Raw/ { disk_size[counter] = $3 $4 }
    /Firmware state/ { state_drive[counter] = $3 }
    /Inquiry/ { name_drive[counter] = $3 }
    /Foreign/ { Foreign[counter] = $3 }
    /Device Speed/ { Disk_speed[counter] = $3 }
    /Link Speed/ { link_speed[counter] = $3 }
    /Drive Temperature/ { disk_tmp[counter] = $3 }
    /Drive has flagged a S.M.A.R.T alert/ { smart_error[counter] = $8 }
    END{
    for (i=1; i<=counter; i+=1)
    printf ( "|%-2s|%-2s|%-28s|%-8s|%-20s|%-3s|%-5s|%-7s|%s|%-3s|%s|\n",
    ENC[i],
    slot[i],
    name_drive[i],
    disk_size[i],
    state_drive[i],
    MD_error[i],
    Foreign[i],
    Disk_speed[i],
    link_speed[i],
    smart_error[i],
    disk_tmp[i]);}

#MegaCli pdlist a0|awk -f analysis.awk
