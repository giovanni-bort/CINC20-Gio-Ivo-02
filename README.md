#  MATLAB classifier for the PhysioNet/CinC Challenge 2020

## Contents 1
Matlab classifier of Bortolan Giovanni -Christof Ivaylo  - version 1

## Contents 2

This classifier uses three scripts:

* `run_12ECG_classifier.m` makes classifications on 12-Leads ECG data.  Add your prediction code to the `run_12ECG_classifier` function. `load_12ECG_model.m` loads model weights, etc. for making classifications.  To reduce your code's run time, add any code to the `load_12ECG_model` function that you only need to run once, such as loading weights for your model.
* `get_12ECG_features.py` extract the features from the clinical time-series data. This script and function are optional, but we have included it as an example. It calls all the functions inside the `Tools` folder 
* `driver.m` calls `load_12ECG_model` once and `run_12ECG_classifier` many times. It also performs all file input and output.  **Do not** edit this script -- or we will be unable to evaluate your submission.

Check the code in these files for the input and output formats for the `load_12ECG_model` and `run_12ECG_classifier` functions.

## Running

You can run this classifier code by starting MATLAB and running

    driver(input_directory, output_directory)

where `input_directory` is a directory for input data files and `output_directory` is a directory for output classification files.  The PhysioNet/CinC 2020 webpage provides a training database with data files and a description of the contents and structure of these files.

## Submission

The `driver.m`, `get_12ECG_score.m`, and `get_12ECG_features.m` scripts need to be in the base or root path of the Github repository. If they are inside a subfolder, then the submission will fail.

## Details

Test Repository 

