# Homework 5 Project

## Project Structure

The project consists of the following files and directories:

- **docs/hw05.md**: Contains the main instructions and specifications for Homework 5, outlining the tasks to be completed, including text processing requirements and expected output files.
- **docs/hw05notes.md**: Provides additional notes on using Make, Gawk, and shell scripting for automation, including tutorials on the basics of Make and advanced text processing techniques.
- **data/data.txt**: The input data file containing approximately 50 paragraphs that will be processed according to the specifications in hw05.md.
- **scripts/killstopXXX.awk**: An AWK script used to remove stop words from the text as part of the text processing pipeline.
- **scripts/ZZZ.awk**: Another AWK script used for generating the word frequency table based on the processed text.
- **Makefile**: Automates the process of cleaning the text, removing stop words, identifying frequent words, and generating the word frequency table. It defines targets, dependencies, and commands for each step of the homework assignment.

## Instructions

To run the project, follow these steps:

1. Ensure you have `gawk` and `make` installed on your system.
2. Navigate to the project directory:
   ```
   cd hw05-project
   ```
3. Run the Makefile to execute the text processing pipeline:
   ```
   make
   ```
4. To view the output files generated, check the `data` directory for the processed results.

## Additional Notes

- Each step of the text processing can be executed individually using the following commands:
  - `make step1`: Clean the text and convert it to lowercase.
  - `make step2`: Remove stop words from the cleaned text.
  - `make step3`: Identify the top ten most frequent words.
  - `make step4`: Generate a word frequency table.

For further details on the usage of Make, Gawk, and shell scripting, refer to the documentation in `docs/hw05notes.md`.