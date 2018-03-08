#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "csvparser.h"
#define TWEET_MAX 20000
struct tweet_container {
  char tweet_name_array[TWEET_MAX][16];
};

int main() {
    int i =  0;
    int tweet_count = 0;
    struct tweet_container * all_tweeters;
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
        printf("tweet container at %d: %s\n",tweet_count, all_tweeters->tweet_name_array[tweet_count] );

        CsvParser_destroy_row(row);
        tweet_count++;
    }
    CsvParser_destroy(csvparser);
    free(all_tweeters);
    return 0;
}
