# DistC2C
## Contour-to-contour distance
![screenshot](https://github.com/user-attachments/assets/bbe3b11f-3634-4e2f-8a6c-4e1d889d3d25)


This function calculates the contour-to-contour distance by using Euclidean distance transform.

**[MeanDist, StdevDist, MaxDist]= DistC2C( GTfilename, Inputfilename)**

== Input argument ==

**GTfilename**: filename of ground-truth <br>
**Inputfilename**: filename of the to-be-compare image

== Outputs ==

**MeanDist**: mean contour-to-contour distance <br>
**StdevDist**: standard deviation. (because we derive the contour-to-contour distance in pixel-wise manner.) <br>
**MaxDist**: max contour-to-contour distance

This is a repost of my previous MATLAB Central File Exchange submission: <br> https://www.mathworks.com/matlabcentral/fileexchange/75551-contour-to-contour-distance

Please cite: <br>
@article{shao2020ic, <br>
  title={From IC Layout to Die Photograph: A CNN-Based Data-Driven Approach}, <br>
  author={Shao, Hao-Chiang and Peng, Chao-Yi and Wu, Jun-Rei and Lin, Chia-Wen and Fang, Shao-Yun and Tsai, Pin-Yian and Liu, Yan-Hsiu}, <br>
  journal={IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems}, <br>
  volume={40}, <br>
  number={5}, <br>
  pages={957--970}, <br>
  year={2021}, <br>
  publisher={IEEE} <br>
}
