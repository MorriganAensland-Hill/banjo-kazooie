#include <ultra64.h>
#include "functions.h"
#include "variables.h"

/* .bss */
struct {
    u32 pressed_count[0xE];
    u32 released_count[0xE];
    u8 state[0xE];
    u8 prev_state[0xE];
} bakey;


/* .code */
void bakey_reset(void){
    s32 i;

    for(i = 0; i<0xe; i++){
        bakey.pressed_count[i] = bakey.released_count[i] = 0;
        bakey.state[i] = bakey.prev_state[i] = 0;
    }
}

void bakey_update(void){
    s32 i;

    bakey.pressed_count[0] = controller_getStartButton(0);
    func_8024E60C(0, &bakey.pressed_count[1]);
    func_8024E6E0(0, &bakey.pressed_count[4]);
    controller_copyFaceButtons(0, &bakey.pressed_count[8]);
    for(i=0; i<0xE; i++){//L802954A8
        bakey.prev_state[i] = bakey.state[i];
        if(bakey.state[i]){
            bakey.pressed_count[i] = 0;
            if(bakey.state[i] == 2)
                bakey.state[i] = 0;
        }
        bakey.released_count[i] = (bakey.pressed_count[i])? 0: bakey.released_count[i] + 1 ;
    }
    if(gctransition_8030BDC0()){
        bakey_reset();
    }
}


int bakey_heldCount(s32 button_indx){
    return bakey.pressed_count[button_indx];
}

int bakey_releaseCount(s32 button_indx){
    return bakey.released_count[button_indx];
}

int bakey_pressed(s32 button_indx){
    return bakey.pressed_count[button_indx] == 1;
}

int bakey_newlyReleased(s32 button_indx){
    return bakey.released_count[button_indx] == 1;
}

u32 bakey_held(s32 button_indx){
    return bakey.pressed_count[button_indx];
}

int bakey_released(s32 button_indx){
    return bakey.released_count[button_indx];
}

int bakey_getAndSetState(s32 button_indx, s32 val){
    bakey.state[button_indx] = val;
    return bakey.prev_state[button_indx];
}

void bakey_disableAll(s32 arg0){
    s32 i;
    for(i=0; i<0xe; i++){
        bakey_getAndSetState(i, arg0);
    }
}
