#
# based on rmr-master.sh from rmr-1.2 release. Copyright retained below:
#
# Copyright 2011 Revolution Analytics
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

sudo yum -y --enablerepo=epel install R R-devel

sudo R --no-save << EOF
install.packages(c('functional','RJSONIO', 'itertools', 'digest', 'Rcpp', 'plyr', 'DPpackage', 'ggplot2', 'mixtools', 'McSpatial', 'spdep', 'foreach'), repos="http://cran.revolutionanalytics.com", INSTALL_opts=c('--byte-compile') )
EOF

# if you always like to be up-to-date, you can install the latest version
# of rmr directly from RHadoop's github repository:
#
# branch=master
#
# wget --no-check-certificate https://github.com/RevolutionAnalytics/RHadoop/tarball/$branch -O - | tar zx
# mv RevolutionAnalytics-RHadoop* RHadoop
# sudo R CMD INSTALL --byte-compile RHadoop/rmr/pkg/

# but I'm usually not that adventurous:

wget --no-check-certificate https://github.com/downloads/RevolutionAnalytics/RHadoop/rmr2_2.0.0.tar.gz
sudo R CMD INSTALL rmr2_2.0.0.tar.gz

sudo su << EOF1
cat >> /etc/profile <<EOF

export HADOOP_HOME=/usr/lib/hadoop

EOF
EOF1
