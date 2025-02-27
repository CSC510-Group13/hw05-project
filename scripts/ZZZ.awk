#!/usr/bin/gawk -f

# This script assumes:
#   - The first input file is the top words file.
#   - The second input file is the cleaned text.
#
# It reads the top words (one per line) and then processes the cleaned text by paragraphs.
# For each paragraph it prints a comma‐separated list of counts corresponding to the
# frequency of each top word (in the order they appear in the top words file),
# followed by a trailing comma.

# Process the top words file (first file)
NR == FNR {
  if ($0 != "") {
    top[++n] = $0
  }
  next
}

# When starting the second file, build a lookup map from the top words.
FNR==1 && NR != FNR {
  for(i=1;i<=n;i++){
    topMap[top[i]] = 1
  }
}

# Process the cleaned text file
{
  # A blank line marks the end of a paragraph.
  if ($0 ~ /^[[:space:]]*$/) {
    output_paragraph()
    delete counts
    next
  }
  # Count occurrences of each word in the line.
  for(i=1; i<=NF; i++){
    word = $i
    if(word in topMap) {
      counts[word]++
    }
  }
}

# If the file doesn't end with a blank line, output the last paragraph.
END {
  output_paragraph()
}

# Function to output frequencies for the current paragraph.
function output_paragraph(   j, cnt) {
  # Only output if this paragraph contained any text (or if we want zeros for empties)
  if(n == 0) return
  for(j = 1; j <= n; j++){
    cnt = (top[j] in counts) ? counts[top[j]] : 0
    printf "%d,", cnt
  }
  print ""
}