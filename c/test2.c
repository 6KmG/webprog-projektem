struct systemTime {
  short wYear;
  short wMonth;
  short wDayOfWeek;
  short wDay;
  short wHour;
  short wMinute;
  short wSecond;
  short wMilliseconds;
};

void GetSystemTime(struct systemTime*);
int printf(const char*, ...);

int _main(){
    struct systemTime st;
    GetSystemTime(&st);

    printf("%.12d\n",st.wMilliseconds);
}