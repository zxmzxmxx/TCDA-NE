# TCDA-NE
The project is a community detection domain algorithm, based on the principle of non-negative matrix decomposition.

The project file is structured as follows:
  --code
    -TTNMFmain.m  (Main project file, runtime entry, contains parameter modifications.)
    -dynamicnmf2.m (Algorithm file containing the main elements of the TCDA-NE algorithm)
    -computePerformance.m (Computational performance metrics, including CA,CR,CP,CF,CNMI)
    -computeNMI.m (Computational CNMI)
    -readfile.m (Read files, reads the contained file according to the input folder path)
  --Data
    data folder
    An LFR case dataset was given.
    The dataset can be customized according to the requirements, and the content format is as follows: 
      It contains two matrices, one of which is W_Cube which represents the input adjacency matrix as a model representation of the complex network, and the other one is GT_Cube, which is the real community matrix and represents the theoretical criterion results.

For questions and communication please contact email zxmzxmxxx@163.com.
