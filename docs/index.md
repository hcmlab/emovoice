% EmoVoice Documentation
% 
% Johannes Wagner, Lab for Human Centered Multimedia, 31/07/2017

# Introduction {#introduction}

EmoVoice is a set of tools that allows you to build your own real-time emotional recognizers from acoustic properties of speech (not using word information). It is implemented with the [Social Signal Interpration (SSI)](http:\\openssi.net) framework and offers feature extraction, classifier building and testing, as well as, online recognition.

EmoVoice was initally brought to life by Thurid Vogt and her dissertation on ["Real-time automatic emotion recognition from speech"](https://pub.uni-bielefeld.de/download/2301483/2301486) provides a detailed description of the technology. The current implementation still supports the original feature set described in the thesis, though it is now possible to switch to other feature sets, too. In particular, it is possible to use the [openSMILE](http://audeering.com/technology/opensmile/) feature extration tool. Likewise, in additional to the yet widely used [LibSVM](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) classifier, other classification models can be tested.

If you use SSI in your research projects please reference the following paper:

*Johannes Wagner, Florian Lingenfelser, Tobias Baur, Ionut Damian, Felix Kistler, and Elisabeth André. 2013. The social signal interpretation (SSI) framework: multimodal signal processing and recognition in real-time. In Proceedings of the 21st ACM international conference on Multimedia (MM ’13). ACM, New York, NY, USA, 831-834. DOI=10.1145/2502081.2502223* \[[pdf](http://doi.acm.org/10.1145/2502081.2502223)\]

~~~~ bibtex
@inproceedings{Wagner13,
 author = {Wagner, Johannes and Lingenfelser, Florian and Baur, Tobias and Damian, Ionut and Kistler, Felix and Andr{\'e}, Elisabeth},
 title = {The social signal interpretation (SSI) framework: multimodal signal processing and recognition in real-time},
 booktitle = {Proceedings of the 21st ACM international conference on Multimedia},
 series = {MM '13},
 year = {2013},
 isbn = {978-1-4503-2404-5},
 location = {Barcelona, Spain},
 pages = {831--834},
 numpages = {4},
 url = {http://doi.acm.org/10.1145/2502081.2502223},
 doi = {10.1145/2502081.2502223},
 acmid = {2502223},
 publisher = {ACM},
 address = {New York, NY, USA},
 keywords = {multimodal fusion, open source framework, real-time pattern recognition, social signal processing},
}
~~~~

# Overview {#overview}

The following figure gives an overview of the basic processing steps the raw audio signal is passed through, which are:

1. voice activity detection to find segments with speech (see [section](#data-preparation))
1. extract a comprehensive set of speech features (see [section](#feature-extraction))
1. train a classifier to map feature vectors onto a set of discrete classes (see [section](#classification-model))

Once a classification model has been trained, it can be used to predict unseen speech chunks in real-time (see [section](#online-recognition)).

![*Overview of EmoVoice: voice activity detection (VAD) is applied to segment the raw speech signal into speech chunks (top). Chunks are transformed into a compact feature representation (center) and a classification model is trained to map them onto a set of discrete classes.*](pics/overview.png){#fig:overview width=100%}

# Before you start {#before-you-start}

EmoVoice is primarily developed and tested on Windows systems. To use it on Unix-based platforms you will have to download and compile [SSI](http://openssi.net) the code yourself. The following guide assumes you are using Windows. Also, EmoVoice does not come with a large audio corpus. For testing a script is provided to download data and train a classifier for seven basic emotions). However, we recommend to use your own recordings (if you opt to train a user-dependent model) or enlarge the amount of data. The quality of a classifier depends highly on the quality *AND* quantity of the data available for training. The more hours of speech and the more speakers (in case you opt for a speaker-independent system) the better!

Before you start, make sure [Python 3.x](https://www.python.org/downloads/) is installed and has been added to the `%PATH%` variable (you can choose this during the installation). Note that the scripts will not work with older versions of Python. Also make sure [Visual Studio 2015 Redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=52685) is installed on your system. Now, check out the EmoVoice [repository](https://github.com/hcmlab/emovoice) from Github and run the `do_bin.cmd` script. This will download the core tools to the `bin\` folder. Whenever you wish to update EmoVoice to the latest version, re-run the script. Note that all other dependencies will be automatically resolved on-demand, so please make sure to have a stable internet connection while running EmoVoice.
 
If you want to test EmoVoice or do not have an own corpus at hand, you may want to run the `do_data.cmd` script next. This will download the audio samples from the [Berlin Database of Emotional Speech](http://emodb.bilderbar.info/index-1024.html). The data was recorded as a part of the DFG funded research project SE462/3-1 in 1997 and 1999 and contains a database of emotional utterances spoken by actors. For more information check the references [here](http://emodb.bilderbar.info/index-1024.html). After running the script you will find folders for six basic emotions and neutral in the `data\\chunks` folder including 533 wav files (see next [section](#audio-signal)).

# Audio Signal {#audio-signal}

The input to EmoVoice are raw audio signals in the popular Waveform Audio File Format (commonly known as WAV due to its filename extension). Since the training of a classification model requires several hours of speech, it may be distributed across multiple files. The sample rate of the files should be at least 8 kHz and must not vary between files. Only mono audio (i.e. one channel) is supported.

# Data Preparation {#data-preparation}

EmoVoice expects for each audio file another file that assigns to each speech segments a discrete class label, e.g. anger, happiness, sadness, etc. The format of the (discrete) annotation files are described [here](https://rawgit.com/hcmlab/nova/master/docs/index.html#file-format). If you have continuous audio recordings with varying emotional content, we recommend using our free open-source tool NOVA ((NOn)Verbal Annotator) to create the necessary annotation files. NOVA provides a graphical interface for annotating and can be downloaded from [here](https://github.com/hcmlab/nova). Please consult the [documentation](https://rawgit.com/hcmlab/nova/master/docs/index.html) of NOVA to learn how to use the tool. For each audio file (.wav) create annotation file with the same name (.annotation) and copy all files the folder `data\combined\`.

If you are using the default database or your corpus exists of chunked audio files (each expressing a single emotion), the tool 'vadanno.exe' (see `bin\` folder) can be used to prepare your data. The tool will combine the chunks to a single recording per class, apply Voice Activity Detection (VAD) and create the annotations. Therefore go to the `data\chunks\` folder and create a folder for each emotion class. Then copy your audio files to the according folders. Now, run the `do_vad.cmd` script with the following parameters:

```
> do_vad 16000 "anger;boredom;disgust;fear;happiness;neutral;sadness"
```

If you use your own data, replace the sample rate and the class names accordingly (make sure to quote the class names!). As a result in the `data\combined`folder you should now see a single wav file per class and according annotations. Open the files in [NOVA](https://github.com/hcmlab/nova) to check the segmentation. If necessary, play around with the parameters in the 'activity.option' file (in the `data\chunks` folder). It allows to set the type of activity signal (0=loudness, 1=intensity, 2=signal-to-noise ratio) and the activity threshold (default=0.05). Re-run the script until you are happy with th result. Note that the method requires a clean speech signal with low background noise, ideally recorded with a head mounted microphone. If your recordings are too noisy consider using an external tool like [Audacity](http://www.audacityteam.org/) to clean your files.

# Feature Extraction {#feature-extraction}

During the feature extraction step, speech segments described the annotation will be transformed into a compact representation and labelled with the according emotional class. The result will be a sample list for each class stored to the `data\combined` folder. To start the feature extraction run the `do_samples.cmd` script with the desired feature set:

```
> do_samples compare
```

The following feature sets are available (from the `chains\` folder):

Set       #Features  Description
--------  ---------  ------------------------------------------------------
emovoice  1451	     The original EmoVoice feature set described [here](https://dl.acm.org/citation.cfm?id=1425679)
compare	  6373		 The ComParE feature set described [here](http://emotion-research.net/sigs/speech-sig/is2013_compare.pdf)
gemaps	  58		 The Geneva Minimalistic feature set described [here](http://ieeexplore.ieee.org/document/7160715/)

# Classification Model {#classification-model}

To train the classification model call the `do_train.cmd` script. Two arguments are expected, which are the name of the classifier and the feature set (see last section):

```
> do_train linsvm compare
```

All training data is used to build the model and the result can be found in the `models` folder under the name `<model>.<feature>.*`. To evaluate the quality of the model call the `do_eval` instead. This will use half of the data to train the model and evaluate with the other half (and vice versa). The result of the evaluation is a confusion matrix showing the accuracy for each class, as well as, the overall recognition rate. The output will be shown in the console and also stored to a file `models\<model>.<feature>.txt`. No model files will be created during the evaluation.

```
> do_eval linsvm compare
```

The following classification models are available (from the `models\` folder):

Set       Description
--------  ------------------------------------------------------
svm	  	  Support Vector Machine classifier based on the [LibSVM](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) library
linsvm    Linear Support Vector Machine classifier based on the [LibLinear](https://www.csie.ntu.edu.tw/~cjlin/liblinear/) library

To tune the classifiers see the according `.option` files in the `model\` folder.

# Online Recognition {#online-recognition}

Once a model has been trained it can be used to classify emotional speech in real-time. Therefore, a SSI pipeline named `emovoice.pipeline` has been added to the root folder of EmoVoice. To start the pipeline use the script `do_run` and again pass the model type and the feature set:

```
> do_run linsvm compare
```

By default this will start the recognition on a file in the corpus. To change the path of the file or to test your model with live input from a microphone, open the file  `emovoice.pipeline-config` in a text editor and change the option `audio:live`, `audio:file` and `audio:rate`. More information about SSI pipelines can be found in the official [documentation](https://rawgit.com/hcmlab/ssi/master/docs/index.html#xml).

