#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "csvparser.h"

#define TWEET_MAX 20000

struct tweet_container {
  char tweet_name_array[TWEET_MAX][16];
};

// A tweeter stat consists of name and count.
struct tweeter_stat {
	int count;
	char name[16];
};

struct tweeter_stat_container {
	struct tweeter_stat * individual_tweeter_stats[TWEET_MAX];
};

int main() {
    int i =  0;
    int tweet_count = 0;
    struct tweet_container* all_tweeters;
    struct tweet_stat_container* stats;

    //                                   file, delimiter, first_line_is_header?
    CsvParser *csvparser = CsvParser_new("cl-tweets-short.csv", ",", 1);
    CsvRow *header;
    CsvRow *row;

    header = CsvParser_getHeader(csvparser);
    if (header == NULL) {
        printf("%s\n", CsvParser_getErrorMessage(csvparser));
        return 1;
    }

    all_tweeters = malloc(sizeof(struct tweet_container));
    stats = malloc(sizeof(struct tweeter_stat_container));

    char **headerFields = CsvParser_getFields(header);
    for (i = 0 ; i < CsvParser_getNumFields(header) ; i++) {
        printf("TITLE: %s\n", headerFields[i]);
    }

    // CsvParser_destroy_row(header); -> causes error in current version
    while ((row = CsvParser_getRow(csvparser)) ) {
        printf("NEW LINE:\n");
        char **rowFields = CsvParser_getFields(row);
        
        // for (i = 0 ; i < CsvParser_getNumFields(row) ; i++) {
        //     printf("FIELD: %s\n", rowFields[i]);
        // }

        printf("FIELD: %s\n", rowFields[8]);
        strncpy(all_tweeters->tweet_name_array[tweet_count],rowFields[8],16);
        //all_tweeters->tweet_name_array[tweet_count]
        printf("tweet container at %d: %s\n",tweet_count, all_tweeters->tweet_name_array[tweet_count]);

        CsvParser_destroy_row(row);
        tweet_count++;
    }

    int n = tweet_count;
    char temp[16];

    for (int i = 0; i < n - 1 ; i++) {
    	for (int j = i + 1; j < n; j++) {
            
            // e.g. Bob, Alice strcasecmp
            // if (strcmp(all_tweeters->tweet_name_array[i], all_tweeters->tweet_name_array[j]) > 0) 
    		if (strcmp(all_tweeters->tweet_name_array[i], all_tweeters->tweet_name_array[j]) > 0) 
            {
            	strncpy(temp, all_tweeters->tweet_name_array[i], 16);
                strncpy(all_tweeters->tweet_name_array[i], all_tweeters->tweet_name_array[j], 16);
                strncpy(all_tweeters->tweet_name_array[j], temp, 16);
            }

        }
    }

    for (int i = 0; i < tweet_count; i++) {
    	printf("%s\n", all_tweeters->tweet_name_array[i]);
    }


    /* Count number of tweets per user. Store in tweet_stat_container */
    int count = 0;
    int amount_found=0;
    for (int i = 0; i < tweet_count - 1; i++) {
    	amount_found++;
		stats->individual_tweeter_stats[i] = malloc(sizeof(struct tweeter_stat));
		if (all_tweeters->tweet_name_array[i] != all_tweeters->tweet_name_array[i + 1]) {
			stats->individual_tweeter_stats[i]->name = all_tweeters->tweet_name_array[i];
			stats->individual_tweeter_stats[i]->count = count;
			count = 0; // Reset count
			continue;
		}
		
		count++;
    }

    for (int i = 0; i < 100; i++) {
    	printf("Name: %s count%d\n", stats->individual_tweeter_stats[i].name, stats->individual_tweeter_stats[i].count);
    }


    CsvParser_destroy(csvparser);
    free(all_tweeters);
    free(stats);

    return 0;
}
