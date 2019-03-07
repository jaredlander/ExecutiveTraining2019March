
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Live Training

This is a repo containing an R project for training courses organized by
[Lander Analytics](www.landeranalytics.com).

Please follow all instructions to set up your environment for the
training.

# Get Started

To get started run the following code to install the latest version of
the `usethis` package which will help our setup.

<div class="sourceCode">

<pre class='sourceCode r'><code class='sourceCode r'>
install.packages(c(
    'usethis'
))
</code></pre>

</div>

# Project Structure

Making use of RStudio projects greatly improves the user experience. To
facilitate this users should run the following code which will recreate
this project on their computer. Be sure to select the positive prompts
such as `yes`, `yeah`,
etc.

``` r
newProject <- usethis::use_course('https://github.com/jaredlander/ExecutiveTraining2019March/archive/master.zip')
```

After running this code you will be in an RStudio Project called
`ExecutiveTraining2019March-master`. You can see this in the top right
of RStudio (the name in the image may be different).

![](images/ProjectCorner.png)<!-- -->

# Packages and Data

The following lines of code will install necessary packages and download
data for the class. Run the following two lines of code for this to be
handled automatically. This requires that you are using an [RStudio
Project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)
setup exactly like this repo, which is done if you followed the
preceding code.

``` r
source('prep/InstallPackages.r')
source('prep/DownloadData.r')
```

# Finish

At this point your environment should be set up for this class and you
are ready to learn about data science with R\!
