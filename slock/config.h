/* user and group to drop privileges to */
static const char *user  = "ziox";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#000000",     /* after initialization */
	[INPUT] =  "#282A36",   /* during input */
	[FAILED] = "#FF5555",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
