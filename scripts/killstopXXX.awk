#!/usr/bin/awk -f

BEGIN {
    # Set field separator to whitespace so words are split correctly
    FS = "[[:space:]]+";

    # Define stop words
    stopwords["is"] = 1;
    stopwords["the"] = 1;
    stopwords["in"] = 1;
    stopwords["but"] = 1;
    stopwords["can"] = 1;
    stopwords["of"] = 1;
    stopwords["to"] = 1;
    stopwords["that"] = 1;
    stopwords["it"] = 1;
    stopwords["for"] = 1;
    stopwords["on"] = 1;
    stopwords["with"] = 1;
    stopwords["as"] = 1;
    stopwords["this"] = 1;
    stopwords["was"] = 1;
    stopwords["at"] = 1;
    stopwords["by"] = 1;
    stopwords["an"] = 1;
    stopwords["be"] = 1;
    stopwords["from"] = 1;
    stopwords["or"] = 1;
    stopwords["are"] = 1;
}

{
    # Process each word in the line
    for (i = 1; i <= NF; i++) {
        # Convert to lowercase
        word = tolower($i);
        # Remove punctuation
        gsub(/[^a-z]/, "", word);
        # Print the word if it's not a stop word
        if (!(word in stopwords) && word != "") {
            print word;
        }
    }
}