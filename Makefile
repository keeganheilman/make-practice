# A teammate of yours has started a project to create a machine learning pipeline to build a model to predict the number of days it will take for a building permit to be issued in the town of Brockway. They have created all the steps needed to generate this model, but need your help to combine these into a pipeline.

# Your task is to write a Makefile that will tie the existing steps together into a functioning pipeline. 

# Start by examining the steps in the existing python scripts:

# permit_combine.py
# permit_clean.py
# permit_train.py
# Note that there is a fourth script called permit_predict.py that will not be part of the pipeline.

# Study these scripts, try running them with the -h flag to see their usage statements, examine their inputs and outputs to figure out the right order to call them. Then write a Makefile that creates these files:

# artifacts/combined.csv
# artifacts/clean.csv
# artifacts/model.pkl
# Note that the "artifacts" directory is ignored in this repository.

# The command "make artifacts/model.pkl" must generate the artifact/model.pkl, and the other two intermediate files.



JSON_DIRECTORY:= input_data/
COMBINED_DATA_FILE:= artifacts/combined.csv
CLEANED_DATA_FILE:= artifacts/clean.csv
MODEL_FILE:= artifacts/model.pkl

# When no parameters sent from 'make' command
.DEFAULT_GOAL := ${MODEL_FILE}

${COMBINED_DATA_FILE}: permits_combine.py ${JSON_DIRECTORY}
	@echo "Calling permits_combine.py"
	python permits_combine.py ${JSON_DIRECTORY} ${COMBINED_DATA_FILE}

${CLEANED_DATA_FILE}: ${COMBINED_DATA_FILE} permits_clean.py
	@echo "Calling permits_clean.py"
	python permits_clean.py ${COMBINED_DATA_FILE} ${CLEANED_DATA_FILE}

${MODEL_FILE}: ${CLEANED_DATA_FILE} permits_train.py
	@echo "Calling permits_train.py"
	python permits_train.py ${CLEANED_DATA_FILE} ${MODEL_FILE}







