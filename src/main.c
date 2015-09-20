
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char **argv)
{
	//printf("Hello World! Forking to background now and exit in one minute.\n");

	pid_t result = fork();
	FILE *pp;
	FILE *fh; 

	if (result == -1)
	{
		fprintf(stderr, "Failed to fork: %s.", strerror(errno));
		return 1;
	}
	else if (result == 0)
	{
		//Create a session and set the process group id.
		setsid();
		char output[1000];
	
		while(1) {
			output[0] = '\0';
			pp = popen("/usr/bin/betterspeedtest -t 10", "r");
			if (pp != NULL) {
				while (1) {
					char *line;
					char buf[1000];
					line = fgets(buf, sizeof buf, pp);
					if (line == NULL) break;
					//fprintf(stdout, "%s", line);
					strcat(output,line);
					//if (line[0] == 'd') printf("%s", line); /* line includes '\n' */
				}
				pclose(pp);
				//fprintf(stdout, "Writing to file.....\n");
				//fprintf(stdout, "%s", output);
				fh = fopen("/tmp/bandwidth", "wb");
				fprintf(fh,"%s",output);
				fclose(fh);
				//fprintf(stdout, "\n.......Writing done\n");
				
				sleep(300);
			}
		}		
		//Just sleep a minute and exit the daemon.
	}
	else
	{
		//parent
		return 0;
	}
}
