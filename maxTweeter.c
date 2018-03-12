#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

// #include "csvparser.h"

#define TWEET_MAX 20000

/* ---- CSV FILE DATA STRUCTURES ---- */
typedef struct CsvRow {
    char **fields_;
    int numOfFields_;
} CsvRow;

typedef struct CsvParser {
    char *filePath_;
    char delimiter_;
    int firstLineIsHeader_;
    char *errMsg_;
    CsvRow *header_;
    FILE *fileHandler_;
	int fromString_;
	char *csvString_;
	int csvStringIter_;
} CsvParser;


/* ---- TWEET DATA STRUCTURES ---- */
struct tweet_container {
  char tweet_name_array[TWEET_MAX][16];
};

/*
 * Struct to hold the name of a tweeter and 
 * the number of tweets they have written.
 */
struct tweeter_stat {
	int count;
	char name[16];
};

/* 
 * This structure contains an array of tweeter
 * stats representing all tweeters in the CSV file.
 */
struct tweeter_stat_container {
	struct tweeter_stat* individual_tweeter_stats[TWEET_MAX];
};

/* ---- CSV PARSING HELPER FUNCTIONS ---- */
int _CsvParser_delimiterIsAccepted(const char *delimiter) {
    char actualDelimiter = *delimiter;
    if (actualDelimiter == '\n' || actualDelimiter == '\r' || actualDelimiter == '\0' ||
            actualDelimiter == '\"') {
        return 0;
    }
    return 1;
}

CsvParser *CsvParser_new(const char *filePath, const char *delimiter, int firstLineIsHeader) {
    CsvParser *csvParser = (CsvParser*)malloc(sizeof(CsvParser));
    if (filePath == NULL) {
        csvParser->filePath_ = NULL;
    } else {
        int filePathLen = strlen(filePath);
        csvParser->filePath_ = (char*)malloc((filePathLen + 1));
        strcpy(csvParser->filePath_, filePath);
    }
    csvParser->firstLineIsHeader_ = firstLineIsHeader;
    csvParser->errMsg_ = NULL;
    if (delimiter == NULL) {
        csvParser->delimiter_ = ',';
    } else if (_CsvParser_delimiterIsAccepted(delimiter)) {
        csvParser->delimiter_ = *delimiter;
    } else {
        csvParser->delimiter_ = '\0';
    }
    csvParser->header_ = NULL;
    csvParser->fileHandler_ = NULL;
	csvParser->fromString_ = 0;
	csvParser->csvString_ = NULL;
	csvParser->csvStringIter_ = 0;

    return csvParser;
}

CsvParser *CsvParser_new_from_string(const char *csvString, const char *delimiter, int firstLineIsHeader) {
	CsvParser *csvParser = CsvParser_new(NULL, delimiter, firstLineIsHeader);
	csvParser->fromString_ = 1;	
	if (csvString != NULL) {
		int csvStringLen = strlen(csvString);
		csvParser->csvString_ = (char*)malloc(csvStringLen + 1);
		strcpy(csvParser->csvString_, csvString);
	}	
	return csvParser;
}

void CsvParser_destroy_row(CsvRow *csvRow) {
    int i;
    for (i = 0 ; i < csvRow->numOfFields_ ; i++) {
        free(csvRow->fields_[i]);
    }
    free(csvRow);
}

void CsvParser_destroy(CsvParser *csvParser) {
    if (csvParser == NULL) {
        return;
    }
    if (csvParser->filePath_ != NULL) {
        free(csvParser->filePath_);
    }
    if (csvParser->errMsg_ != NULL) {
        free(csvParser->errMsg_);
    }
    if (csvParser->fileHandler_ != NULL) {
        fclose(csvParser->fileHandler_);
    }
    if (csvParser->header_ != NULL) {
        CsvParser_destroy_row(csvParser->header_);
    }
	if (csvParser->csvString_ != NULL) {
		free(csvParser->csvString_);
	}
    free(csvParser);
}

void _CsvParser_setErrorMessage(CsvParser *csvParser, const char *errorMessage) {
    if (csvParser->errMsg_ != NULL) {
        free(csvParser->errMsg_);
    }
    int errMsgLen = strlen(errorMessage);
    csvParser->errMsg_ = (char*)malloc(errMsgLen + 1);
    strcpy(csvParser->errMsg_, errorMessage);
}


CsvRow *_CsvParser_getRow(CsvParser *csvParser) {
    int numRowRealloc = 0;
    int acceptedFields = 64;
    int acceptedCharsInField = 64;

    /* Print all struct information */
    
    if (csvParser->filePath_ == NULL && (! csvParser->fromString_)) {
        _CsvParser_setErrorMessage(csvParser, "Supplied CSV file path is NULL");
        //printf("filepath: %s\n", csvParser->filePath_);
        return NULL;
    }
    if (csvParser->csvString_ == NULL && csvParser->fromString_) {
        _CsvParser_setErrorMessage(csvParser, "Supplied CSV string is NULL");
        return NULL;
    }
    if (csvParser->delimiter_ == '\0') {
        _CsvParser_setErrorMessage(csvParser, "Supplied delimiter is not supported");
        return NULL;
    }
    if (! csvParser->fromString_) {
        if (csvParser->fileHandler_ == NULL) {
            csvParser->fileHandler_ = fopen(csvParser->filePath_, "r");
            if (csvParser->fileHandler_ == NULL) {
                int errorNum = errno;
                const char *errStr = strerror(errorNum);
                char *errMsg = (char*)malloc(1024 + strlen(errStr));
                strcpy(errMsg, "");
                sprintf(errMsg, "Error opening CSV file for reading: %s : %s", csvParser->filePath_, errStr);
                _CsvParser_setErrorMessage(csvParser, errMsg);
                free(errMsg);
                return NULL;
            }
        }
    }
    CsvRow *csvRow = (CsvRow*)malloc(sizeof(CsvRow));
    csvRow->fields_ = (char**)malloc(acceptedFields * sizeof(char*));
    csvRow->numOfFields_ = 0;
    int fieldIter = 0;
    char *currField = (char*)malloc(acceptedCharsInField);
    int inside_complex_field = 0;
    int currFieldCharIter = 0;
    int seriesOfQuotesLength = 0;
    int lastCharIsQuote = 0;
    int isEndOfFile = 0;
    while (1) {
        char currChar = (csvParser->fromString_) ? csvParser->csvString_[csvParser->csvStringIter_] : fgetc(csvParser->fileHandler_);
        csvParser->csvStringIter_++;
        int endOfFileIndicator;
        if (csvParser->fromString_) {
            endOfFileIndicator = (currChar == '\0');
        } else {
            endOfFileIndicator = feof(csvParser->fileHandler_);
        }
        if (endOfFileIndicator) {
            if (currFieldCharIter == 0 && fieldIter == 0) {
                _CsvParser_setErrorMessage(csvParser, "Reached EOF");
                return NULL;
            }
            currChar = '\n';
            isEndOfFile = 1;
        }
        if (currChar == '\r') {
            continue;
        }
        if (currFieldCharIter == 0  && ! lastCharIsQuote) {
            if (currChar == '\"') {
                inside_complex_field = 1;
                lastCharIsQuote = 1;
                continue;
            }
        } else if (currChar == '\"') {
            seriesOfQuotesLength++;
            inside_complex_field = (seriesOfQuotesLength % 2 == 0);
            if (inside_complex_field) {
                currFieldCharIter--;
            }
        } else {
            seriesOfQuotesLength = 0;
        }
        if (isEndOfFile || ((currChar == csvParser->delimiter_ || currChar == '\n') && ! inside_complex_field) ){
            currField[lastCharIsQuote ? currFieldCharIter - 1 : currFieldCharIter] = '\0';
            csvRow->fields_[fieldIter] = (char*)malloc(currFieldCharIter + 1);
            strcpy(csvRow->fields_[fieldIter], currField);
            free(currField);
            csvRow->numOfFields_++;
            if (currChar == '\n') {
                return csvRow;
            }
            if (csvRow->numOfFields_ != 0 && csvRow->numOfFields_ % acceptedFields == 0) {
                csvRow->fields_ = (char**)realloc(csvRow->fields_, ((numRowRealloc + 2) * acceptedFields) * sizeof(char*));
                numRowRealloc++;
            }
            acceptedCharsInField = 64;
            currField = (char*)malloc(acceptedCharsInField);
            currFieldCharIter = 0;
            fieldIter++;
            inside_complex_field = 0;
        } else {
            currField[currFieldCharIter] = currChar;
            currFieldCharIter++;
            if (currFieldCharIter == acceptedCharsInField - 1) {
                acceptedCharsInField *= 2;
                currField = (char*)realloc(currField, acceptedCharsInField);
            }
        }
        lastCharIsQuote = (currChar == '\"') ? 1 : 0;
    }
}

const char *CsvParser_getErrorMessage(CsvParser *csvParser) {
    return csvParser->errMsg_;
}

CsvRow *CsvParser_getRow(CsvParser *csvParser) {
    if (csvParser->firstLineIsHeader_ && csvParser->header_ == NULL) {
        csvParser->header_ = _CsvParser_getRow(csvParser);
    }
    return _CsvParser_getRow(csvParser);
}


CsvRow *CsvParser_getHeader(CsvParser *csvParser) {
    if (! csvParser->firstLineIsHeader_) {
        _CsvParser_setErrorMessage(csvParser, "Cannot supply header, as current CsvParser object does not support header");
        return NULL;
    }
    if (csvParser->header_ == NULL) {
        csvParser->header_ = _CsvParser_getRow(csvParser);
    }
    return csvParser->header_;
}

int CsvParser_getNumFields(CsvRow *csvRow) {
    return csvRow->numOfFields_;
}

char **CsvParser_getFields(CsvRow *csvRow) {
    return csvRow->fields_;
}

int getNumOcs(char* str, char* needle) {
    char *p = malloc(sizeof(char)*1000);
    strncpy(p, str, 1000);
    int total = 0;
    while ( (p=strstr(p, needle)) != NULL )
    {
        total++;
        p++;
    }
    
    free(p);
    return total;
}

/* ---- MAIN ---- */
int main(int argc, char **args) {
    int i =  0;
    int tweet_count = 0;
    struct tweet_container* all_tweeters;
    //struct tweet_stat_container* stats;
    struct tweeter_stat * stats;

    if (argc !=2 )
        exit(0);

    if (args[0] == NULL)
        exit(0);
    
    if (args[1] == NULL)
        exit(0);
    
    char *csv_file = args[1];
    FILE *fp;
    fp = fopen(csv_file, "r");

    if(fp == NULL) {
      perror("Error opening file");
      return(-1);
   }

    /* Trying to not crash */
    char header_string[2000];

    // If header is NULL invalid
    if (fgets (header_string, 2000, fp) == NULL) {
        exit(0);
    }

    char header_copy[2000];
    strncpy(header_copy, header_string, 1000);

    char *token = malloc(sizeof(char)*1000);
    token = strtok (header_copy,",");
    
    int found_name = 0;
    int header_count = 0;
    int name_spot = -1;
    int newLineCount = 0;
    int text_spot = 0;
    
    while (token != NULL)
    {
        printf ("%s\n",token);

        // Ensure start and end of token is a quote mark
        if (token[strlen(token)-1] == '\n' && newLineCount < 2) {
            newLineCount += 1;
        }
        
        else if (token[0] != 34 || token[strlen(token)-1] != 34) {
            printf("token 0:%c\n", token[0]);
            printf("token last:%c\n", token[strlen(token)-1]);
            printf("Quote mark missing at start of header\n");
            printf("Invalid Input Format\n");
            exit(0);
        }

        if (newLineCount > 1) {
            printf("Invalid Input Format\n");
            exit(0);
        }

        int quoteNum = getNumOcs(token, "\"\"");
        if (quoteNum > 2) {
            printf("Invalid Input Format\n");
            exit(0);
        }

        int commaNum = getNumOcs(token, ",");
        if (commaNum > 0) {
            printf("Invalid Input Format\n");
            exit(0);
        }
        
        if (strncmp(token, "\"name\"", 6) == 0)
        {
            name_spot = header_count;
            found_name = 1;
        }

        if (strncmp(token, "\"text\"", 6) == 0)
        {
            text_spot = header_count;
        }
        
        token = strtok (NULL, ",");
        header_count++;
    }

    if (found_name == 0)
    {
        printf("Did not find name column\n");
        exit(0);
    }
    //    if (header_count != 16)
    //  exit(0);
    
    // file, delimiter, first_line_is_header?
    //CsvParser *csvparser = CsvParser_new("cl-tweets-short.csv", ",", 1);
    CsvParser *csvparser = CsvParser_new(csv_file, ",", 1);
    CsvRow *header;
    CsvRow *row;

    header = CsvParser_getHeader(csvparser);
    
    if (header == NULL) {
        printf("%s\n", CsvParser_getErrorMessage(csvparser));
        exit(0);
        //return 1;
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

        int commaNum = getNumOcs(rowFields[text_spot], ",");
        if (commaNum > 0) {
            printf("Invalid Input Format\n");
            exit(0);
        }
        
        printf("FIELD: %s\n", rowFields[name_spot]);
        strncpy(all_tweeters->tweet_name_array[tweet_count],rowFields[name_spot], 16);
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
    fclose(fp);
    return 0;
}
