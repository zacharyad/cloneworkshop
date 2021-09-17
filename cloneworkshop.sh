
#!/usr/local/bin/node
args=("$@")
repoURLToCloneAndStripGit=${args[0]}
newRepoName=${args[1]}_Solution

if [ $# == 0 ]
then
    echo "There needs to be a single arguments for this commands. please paste the git clone link following".
    echo "Error!" >> logfile.log
    exit 125
fi

echo "Commands initialized correctly" >> logfile.log
echo "---------"

destinationDir=`pwd`

# create Temp dir to clone, strip out .git and copy to dir command was run

echo "Creating tempdir to clone repo, remove .git file, and then mv to current dir" >> logfile.log

(mkdir ~/tmpDir && 
cd ~/tmpDir && 
git clone $repoURLToCloneAndStripGit $newRepoName && cd $newRepoName && rm -rf .git && git init && git add . && git commit -m "Initial Commit")

currPath=`pwd`

echo $repoURLToCloneAndStripGit $newRepoName $destinationDir/ ls ..$currPath

cp -R ~/tmpDir/${newRepoName} ${destinationDir}
echo "created tempDir, then cloned the repo, and then removed the git history, and then mv everything from the temp dir to current one" >> logfile.log


# teardown the temp repo
rm -rf ~/tmpDir
echo "removed the temp directory" >> logfile.log

echo "Finished Successfully" >> logfile.log
rm logfile.log
echo "Finished successfully"
