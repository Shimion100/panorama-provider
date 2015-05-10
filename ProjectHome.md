This project is expected to combine several related images into panorama.

# Paper related #
  1. The Automatic Panoramic Image Stitching theory is developed by Matthew Brown and David G. Lowe.
  1. For Chinese readers: A translated version of "Automatic Panoramic Image Stitching using Invariant Features" is available in the downloads page. if you find any translate mistakes, please email me, thanks.
> > 翻译成中文的"Automatic Panoramic Image Stitching using Invariant Features"可以在下载页面中找到，如果你在阅读中文版的时候发现任何翻译错误，请email我，我会及时改正，谢谢。

# Code #
  1. I use SURF( Speeded Up Robust Features) instead of SIFT( Scale-invariant feature transform) to generate features, it turns out SURF is much faster than the SIFT program provided on Lowe's webpage.

> ## Version ##
    * There would be two version of the implement, MATLAB & C++.
    * The MATLAB version uses a lot functions already exist in Image Process Toolbox. So it's easy to be used, but not good for learners.
    * The C++ version is written in Visual Studio 2010, with OpenCV 2.2. Most of the functions are written myself. For example, I didn't use cvFindHomography to calculate the homography, instead, I wrote my own RANSAC function.
> ## Note ##
    * The code is developed in MATLAB, the SURF part is developed by Dirk-Jan Kroon from File Exchange, MATLAB center.
    * The other part is developed by **_YIJIA XU_** @ Shanghai University of Engineering Science.
    * The C++ version will be uploaded soon.

> ## Examples ##
> > The example result size is quite big, if you want check them, go to this wiki page:[Demo Result](http://code.google.com/p/panorama-provider/wiki/DemoResult?ts=1299936104&updated=DemoResult)
# Links #
    1. SIFT Paper: The theory of scale invariant feature transform.
    1. Image Stitching Paper: the theory of image stitching.
    1. SURF Code: [click here to download](http://www.mathworks.com/matlabcentral/fileexchange/28300-opensurf-including-image-warp).

# Downloads #
  1. [autostitch.zip](http://panorama-provider.googlecode.com/files/autostitch.zip) - It's a panorama tool provided by David Lowe.
  1. [cn\_ijcv2007.doc](http://panorama-provider.googlecode.com/files/cn_ijcv2007.doc) - Brown and Lowe's paper in Chinese.
  1. [IWMV2010\_PanoramaPainting.pdf](http://code.google.com/p/panorama-provider/downloads/detail?name=IWMV2010_PanoramaPainting.pdf&can=2&q=) - Another way to do image stitching.
# Current progress #
  1. 2010-03-02: Test finished. Able to combine pictures without affine transformation using SIFT.
  1. 2010-03-06: Finished RANSAC part in brown's paper.
  1. 2010-05-14: Working on camera calibration.
  1. 2010-06-06: A translated version of Brown and Lowe's paper is released.
  1. 2010-09-04: Found a new image stitching approach, easy to write code, [click here to download.](http://code.google.com/p/panorama-provider/downloads/detail?name=IWMV2010_PanoramaPainting.pdf&can=2&q=)
  1. 2010-11-30: Reconsidering the structure, split it into several smaller projects.
  1. 2010-12-25: Deciding to finish the image blending part first.
  1. 2011-02-11: Finished Poisson Image Blending, click [here](http://code.google.com/p/imageblending/)  to view the subproject.
  1. 2011-03-02: Running tests on the new panorama code, seems better than previous one.
  1. 2011-05-31: Finished the C++ version of the panorama, gonna run some test on the code.
# Next work #
  1. Combine the two version of the implementations and upload it to the SVN.