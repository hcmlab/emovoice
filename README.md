# EmoVoice

EmoVoice is a set of tools, which allow you to build your own real-time emotion recognizer based on acoustic properties of speech (not using word information).

# Platform

Windows

# Dependencies

* Visual Studio 2015 Redistributable (https://www.microsoft.com/en-us/download/details.aspx?id=52685)

# Installation

Run `install.cmd`. It will download core binaries and install embedded Python for you.

If you plan to extract SoundNet features, you will also have to execute `install_tensorflow.cmd` and download the file [sound8.npy](https://drive.google.com/uc?export=download&id=0B9wE6h4m--wjR015M1RLZW45OEU) into the `chains` folder.

# Documentation

https://rawgit.com/hcmlab/emovoice/master/docs/index.html

# Credits
* [SSI](http://openssi.net) -- Social Signal Interpretation Framework
* [LIBSVM](https://www.csie.ntu.edu.tw/~cjlin/libsvm/) -- A Library for Support Vector Machines
* [LIBLINEAR](https://www.csie.ntu.edu.tw/~cjlin/liblinear/) -- A Library for Large Linear Classification
* [openSMILE](http://audeering.com/technology/opensmile/) -- The Munich Versatile and Fast Open-Source Audio Feature Extractor
* [Emo-DB](http://emodb.bilderbar.info/start.html) -- Berlin Database of Emotional Speech
* [SoundNet](https://github.com/eborboihuc/SoundNet-tensorflow) -- TensorFlow implementation of "[SoundNet](http://soundnet.csail.mit.edu/)"

# Reference

``` bibtex
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
```
# License

The framework is released under LGPL (see LICENSE).
Please note custom license files for the plug-ins (see LICENSE.*).

# Author

Johannes Wagner, Lab for Human Centered Multimedia, 2018