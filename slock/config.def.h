/* user and group to drop privileges to */
static const char *user  = "ziox";
static const char *group = "ziox";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#444b4b",   /* during input */
	[FAILED] = "#614445",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
