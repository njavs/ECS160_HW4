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
    //struct tweet_stat_container* stats;
    struct tweeter_stat * stats;

    // file, delimiter, first_line_is_header?
    CsvParser *csvparser = CsvParser_new("cl-tweets-short.csv", ",", 1);
    CsvRow *header;
    CsvRow *row;

    header = CsvParser_getHeader(csvparser);
    if (header == NULL) {
        printf("%s\n", CsvParser_getErrorMessage(csvparser));
        return 1;
    }

    all_tweeters = malloc(sizeof(struct tweet_container));
    stats = malloc(sizeof(struct tweeter_stat_container)); // To delete?

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
    int j;
    int unique_members = 0;
    stats = malloc(sizeof(struct tweeter_stat) * TWEET_MAX);
    
    for (int i = 0; i < tweet_count - 1; i++) {
      count = 0;

      strncpy(stats[unique_members].name,all_tweeters->tweet_name_array[i],16);
      printf("name to look for:%s\n",stats[i].name);
      printf("current count is:%d\n",stats[i].count);
      j = 1;

      while (!(strncmp(all_tweeters->tweet_name_array[i], all_tweeters->tweet_name_array[i + j], 16))){
        printf("name to look for:%s\n",all_tweeters->tweet_name_array[i]);
        printf("next name: %s\n",all_tweeters->tweet_name_array[i+j]);
        j++;
      }

      stats[unique_members].count = j;
      //count++;
      i = i+j;
      j = 0;
      unique_members++;
      //i=i+j;
    }

    for (int i = 0; i < 100; i++) {
    	printf("Name: %s count: %d\n", stats[i].name, stats[i].count);
    }

    /* Sort stats in descending order by count */
    // stats[i], stats[j]
    struct tweeter_stat temp_stat;
    for (int i = 0; i < unique_members - 1; i++) {
        for (int j = i + 1; j < unique_members; j++) {
            if (stats[i].count < stats[j].count) {
                // reorder the stats array
                temp_stat = stats[i];
                stats[i] = stats[j];
                stats[j] = temp_stat;
            }
        }
    }

    printf("Printing top 10... --------------------- \n");
    for (int i = 0; i < 10; i++) {
        printf("Name: %s, Count: %d\n", stats[i].name, stats[i].count);
    }
    
    CsvParser_destroy(csvparser);
    free(all_tweeters);
    free(stats);

    return 0;
}
