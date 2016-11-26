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

temp_dir=$(mktemp -d)

echo "=> Getting the latest version from GitHub ..."
wget -O "/tmp/$gh_repo.tar.gz" \
  https://github.com/PapirusDevelopmentTeam/$gh_repo/archive/master.tar.gz
echo "=> Unpacking archive ..."
tar -xzf "/tmp/$gh_repo.tar.gz" -C "$temp_dir"
echo "=> Deleting old $gh_desc ..."
rm -rf "<!--/DESTINATION/PATH/DIR1--!>" "<!--/DESTINATION/PATH/DIR2--!>"
echo "=> Installing ..."
cp --no-preserve=mode,ownership -r \
  "$temp_dir/$gh_repo-master/<!--DIR1--!>" \
  "$temp_dir/$gh_repo-master/<!--DIR2--!>" \
  "<!--/DESTINATION/PATH/--!>"
echo "=> Clearing cache ..."
rm -rf "/tmp/$gh_repo.tar.gz" "$temp_dir"
echo "=> Done!"
