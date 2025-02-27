# Define variables
INPUT = data/data.txt
CLEANED = data/cleaned.txt
STOPPED = data/stop.txt
FREQS = data/word_counts.txt
TOP_WORDS = data/top.txt
TABLE = data/table.txt

# Run the full pipeline
all: $(TABLE)

# Step 1: Canonicalization (Kill punctuation, Lowercase)
$(CLEANED): $(INPUT)
	sed 's/[^a-zA-Z ]//g' $< | tr 'A-Z' 'a-z' > $@

# Step 2: Remove stop words
$(STOPPED): $(CLEANED)
	gawk -f scripts/killstopXXX.awk $< > $@

# Step 3: Report frequency of words
$(FREQS): $(STOPPED)
	cat $< | gawk '{for(i=1;i<=NF;i++) count[$$i]++} END {for(word in count) print count[word], word}' | sort -nr > $@

# Step 4: Extract Top 10 most frequent words
$(TOP_WORDS): $(FREQS)
	gawk '$$2 && NR <=10 {print $$2}' $< > $@

# Step 5: Generate table of word frequencies per paragraph
$(TABLE): $(CLEANED) $(TOP_WORDS)
	gawk -f scripts/ZZZ.awk PASS=1 $(TOP_WORDS) PASS=2 $(CLEANED) > $@

# Cleanup
clean:
	rm -f $(CLEANED) $(STOPPED) $(FREQS) $(TOP_WORDS) $(TABLE)

step1:
	$(MAKE) clean $(CLEANED); head $(CLEANED)

step2:
	$(MAKE) clean $(STOPPED); head $(STOPPED)

step3:
	$(MAKE) clean $(TOP_WORDS); head $(TOP_WORDS)

step4:
	$(MAKE) clean $(TABLE); head $(TABLE) # | column -s, -t