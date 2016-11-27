#!/bin/sh

set -e

gh_repo="<--GITHUB_REPO_NAME-->"
gh_desc="<--REPO_DESCIPTION-->"

cat <<- EOF



      ppppp                         ii
      pp   pp     aaaaa   ppppp          rr  rrr   uu   uu     sssss
      ppppp     aa   aa   pp   pp   ii   rrrr      uu   uu   ssss
      pp        aa   aa   pp   pp   ii   rr        uu   uu      ssss
      pp          aaaaa   ppppp     ii   rr          uuuuu   sssss
                          pp
                          pp


  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

echo "=> Removing $gh_desc ..."
rm -rf "<!--/DESTINATION/PATH/DIR1--!>" "<!--/DESTINATION/PATH/DIR2--!>"
echo "=> Done!"
