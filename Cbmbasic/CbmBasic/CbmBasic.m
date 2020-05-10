//
//  CbmBasic.m
//  CbmBasic
//
//  Created by Gregori, Lars on 10.05.20.
//  Copyright © 2020 Gregori, Lars. All rights reserved.
//

#include <string.h> // strcpy, strlen
#include <time.h>

int rpos = -1;
char command[1*1024];

void setCommand(const char* cmd) {
    strcpy(command, cmd);
    rpos = 0;
}

unsigned char mygetchar() {
    while (rpos >= strlen(command))
    {
        // sleep, otherwise CPU goes up to 100%
        nanosleep((const struct timespec[]){{0, 500000000L}}, NULL);
    }
    return command[rpos++];
}

const int RBUF_LEN = 1 * 1024;
char rbuf[RBUF_LEN];
unsigned int rbufstart = 0;
unsigned int rbufend = 0;

void pushChar(unsigned char c) {
    rbuf[rbufend] = c;
    rbufend = (rbufend + 1) % RBUF_LEN;
    if (rbufend == rbufstart) {
        rbufstart = (rbufstart + 1) % RBUF_LEN;
    }
}

unsigned char popChar() {
    if (rbufstart == rbufend) {
        return -1;
    }
    unsigned char c = rbuf[rbufstart];
    rbufstart = (rbufstart + 1) % RBUF_LEN;
    return c;
}
