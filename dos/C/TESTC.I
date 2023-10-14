testc.c 1: 
stdio.h 1: 
stdio.h 2: 
stdio.h 3: 
stdio.h 4: 
stdio.h 5: 
stdio.h 6: 
stdio.h 7: 
stdio.h 8: 
stdio.h 9: 
stdio.h 10: 
stdio.h 11: 
stdio.h 12: 
stdio.h 13: 
stdio.h 14: 
stdio.h 15: 
stdio.h 16: 
stdio.h 17: 
stdio.h 18: 
stdio.h 19: typedef unsigned size_t;
stdio.h 20: 
stdio.h 21: 
stdio.h 22:     
stdio.h 23: 
stdio.h 24: 
stdio.h 25: 
stdio.h 26: 
stdio.h 27: 
stdio.h 28: 
stdio.h 29: 
stdio.h 30: 
stdarg.h 1: 
stdarg.h 2: 
stdarg.h 3: 
stdarg.h 4: 
stdarg.h 5: 
stdarg.h 6: 
stdarg.h 7: 
stdarg.h 8: 
stdarg.h 9: 
stdarg.h 10: 
stdarg.h 11: 
stdarg.h 12: 
stdarg.h 13: 
stdarg.h 14: 
stdarg.h 15: 
stdarg.h 16: 
stdarg.h 17: 
stdarg.h 18: typedef void	*va_list;
stdarg.h 19: 
stdarg.h 20: 
stdarg.h 21: 
stdarg.h 22: 
stdarg.h 23: 
stdarg.h 24: 
stdarg.h 25: 
stdio.h 31: 
stdio.h 32: 
stdio.h 33: 
stdio.h 34: 
stdio.h 35: typedef long    fpos_t;
stdio.h 36: 
stdio.h 37: 
stdio.h 38: 
stdio.h 39: typedef struct  {
stdio.h 40: short           level;          
stdio.h 41: unsigned        flags;          
stdio.h 42: char            fd;             
stdio.h 43: unsigned char   hold;           
stdio.h 44: short           bsize;          
stdio.h 45: unsigned char   *buffer;        
stdio.h 46: unsigned char   *curp;          
stdio.h 47: unsigned        istemp;         
stdio.h 48: short           token;          
stdio.h 49: }       FILE;                           
stdio.h 50: 
stdio.h 51: 
stdio.h 52: 
stdio.h 53: 
stdio.h 54: 
stdio.h 55: 
stdio.h 56: 
stdio.h 57: 
stdio.h 58: 
stdio.h 59: 
stdio.h 60: 
stdio.h 61: 
stdio.h 62: 
stdio.h 63: 
stdio.h 64: 
stdio.h 65: 
stdio.h 66: 
stdio.h 67: 
stdio.h 68: 
stdio.h 69: 
stdio.h 70: 
stdio.h 71: 
stdio.h 72: 
stdio.h 73: 
stdio.h 74: 
stdio.h 75: 
stdio.h 76: 
stdio.h 77: 
stdio.h 78: 
stdio.h 79: 
stdio.h 80: 
stdio.h 81: 
stdio.h 82: 
stdio.h 83: 
stdio.h 84: 
stdio.h 85: 
stdio.h 86: 
stdio.h 87: 
stdio.h 88: 
stdio.h 89: 
stdio.h 90: 
stdio.h 91: 
stdio.h 92: 
stdio.h 93: 
stdio.h 94: 
stdio.h 95: 
stdio.h 96: 
stdio.h 97: 
stdio.h 98: 
stdio.h 99: 
stdio.h 100: 
stdio.h 101: extern  FILE    cdecl  _streams[];
stdio.h 102: 
stdio.h 103: 
stdio.h 104: 
stdio.h 105: 
stdio.h 106: 
stdio.h 107: 
stdio.h 108: 
stdio.h 109: void     cdecl  clearerr (FILE *stream);
stdio.h 110: int      cdecl  fclose   (FILE *stream);
stdio.h 111: int      cdecl  fflush   (FILE *stream);
stdio.h 112: int      cdecl  fgetc    (FILE *stream);
stdio.h 113: int      cdecl  fgetpos  (FILE *stream, fpos_t *pos);
stdio.h 114: char    *cdecl  fgets    (char *s, int n, FILE *stream);
stdio.h 115: FILE    *cdecl  fopen    (const char *path, const char *mode);
stdio.h 116: int      cdecl  fprintf  (FILE *stream, const char *format, ...);
stdio.h 117: int      cdecl  fputc    (int c, FILE *stream);
stdio.h 118: int      cdecl  fputs    (const char *s, FILE *stream);
stdio.h 119: size_t   cdecl  fread    (void *ptr, size_t size, size_t n, FILE *stream);
stdio.h 120: FILE    *cdecl  freopen  (const char *path, const char *mode, 
stdio.h 121: FILE *stream);
stdio.h 122: int      cdecl  fscanf   (FILE *stream, const char *format, ...);
stdio.h 123: int      cdecl  fseek    (FILE *stream, long offset, int whence);
stdio.h 124: int      cdecl  fsetpos  (FILE *stream, const fpos_t *pos);
stdio.h 125: long     cdecl  ftell    (FILE *stream);
stdio.h 126: size_t   cdecl  fwrite   (const void *ptr, size_t size, size_t n,
stdio.h 127: FILE *stream);
stdio.h 128: char    *cdecl  gets     (char *s);
stdio.h 129: void     cdecl  perror   (const char *s);
stdio.h 130: int      cdecl  printf   (const char *format, ...);
stdio.h 131: int      cdecl  puts     (const char *s);
stdio.h 132: int      cdecl  rename   (const char *oldname, const char *newname);
stdio.h 133: void     cdecl  rewind   (FILE *stream);
stdio.h 134: int      cdecl  scanf    (const char *format, ...);
stdio.h 135: void     cdecl  setbuf   (FILE *stream, char *buf);
stdio.h 136: int      cdecl  setvbuf  (FILE *stream, char *buf, int type, size_t size);
stdio.h 137: int      cdecl  sprintf  (char *buffer, const char *format, ...);
stdio.h 138: int      cdecl  sscanf   (const char *buffer, const char *format, ...);
stdio.h 139: char    *cdecl  strerror (int errnum);
stdio.h 140: FILE    *cdecl  tmpfile  (void);
stdio.h 141: char    *cdecl  tmpnam   (char *s);
stdio.h 142: int      cdecl  ungetc   (int c, FILE *stream);
stdio.h 143: int      cdecl  vfprintf (FILE *stream, const char *format, va_list arglist);
stdio.h 144: int      cdecl  vfscanf  (FILE *stream, const char *format, va_list arglist);
stdio.h 145: int      cdecl  vprintf  (const char *format, va_list arglist);
stdio.h 146: int      cdecl  vscanf   (const char *format, va_list arglist);
stdio.h 147: int      cdecl  vsprintf (char *buffer, const char *format, va_list arglist);
stdio.h 148: int      cdecl  vsscanf  (const char *buffer, const char *format, va_list arglist);
stdio.h 149: 
stdio.h 150: 
stdio.h 151: int      cdecl  fcloseall(void);
stdio.h 152: FILE    *cdecl  fdopen   (int handle, char *type);
stdio.h 153: int      cdecl  fgetchar (void);
stdio.h 154: int      cdecl  flushall (void);
stdio.h 155: int      cdecl  fputchar (int c);
stdio.h 156: int      cdecl  getw     (FILE *stream);
stdio.h 157: int      cdecl  putw     (int w, FILE *stream);
stdio.h 158: char    *cdecl  _strerror(const char *s);
stdio.h 159: int      cdecl  unlink   (const char *path);
stdio.h 160: 
stdio.h 161: 
stdio.h 162: 
stdio.h 163: int      cdecl  _fgetc   (FILE *stream);             
stdio.h 164: int      cdecl  _fputc   (char c, FILE *stream);     
stdio.h 165: 
stdio.h 166: 
stdio.h 167: 
stdio.h 168: 
stdio.h 169: 
stdio.h 170: 
stdio.h 171: #pragma warn -pro
stdio.h 172: 
stdio.h 173: #pragma warn .pro
stdio.h 174: 
stdio.h 175: 
stdio.h 176: 
stdio.h 177: 
stdio.h 178: 
stdio.h 179: 
stdio.h 180: 
stdio.h 181: 
stdio.h 182: 
stdio.h 183: 
stdio.h 184: 
stdio.h 185: 
stdio.h 186: 
stdio.h 187: 
stdio.h 188: 
stdio.h 189: 
testc.c 2: 
testc.c 3: int _main()
testc.c 4: {
testc.c 5: printf("Hello world!");
testc.c 6: 
testc.c 7: return 0;
testc.c 8: }
testc.c 9: 