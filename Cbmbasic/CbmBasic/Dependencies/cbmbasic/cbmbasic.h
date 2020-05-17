//
//  cbmbasic.h
//  CbmBasic
//
//  Created by Gregori, Lars on 04.05.20.
//

#ifndef cbmbasic_h
#define cbmbasic_h

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
int main(int llvm_cbe_argc, char **llvm_cbe_argv);
int init_os(int , char **);

/*unsigned*/ int kernal_dispatch(void);

extern unsigned char mygetchar(void);
extern void setCommand(const char*);
extern void pushChar(unsigned char);
extern unsigned char popChar(void);

#endif /* cbmbasic_h */
