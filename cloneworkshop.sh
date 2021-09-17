
#!/usr/local/bin/node
args=("$@")
repoURLToCloneAndStripGit=${args[0]}
newRepoName=${args[1]}_Solution

#Check to see if arguments were supplied, if they were not a message will appear explaining the arguments they need to supply
if [ $# == 0 ]
then
    echo "There needs to be tw0 arguments for this command. Please rerun it and supply the command with --> the git clone link followed by --> the name you want as the folder (this will get "_solution" concatenated to the end.".
    echo "Error!" >> logfile.log
    exit 125
fi

# visual demarkation for output
echo "Commands initialized correctly" >> logfile.log
echo "---------"
echo "--------"
echo "-------"
echo "------"
echo "-----"
echo "----"
echo "---"
echo "--"
echo "-"

#getting the current dir
destinationDir=`pwd`

# As of now this is supperfluous, this log file will get logs added to it but then gets removed. eventually this will be more useful for the script\
echo "Creating tempdir to clone repo, remove .git file, and then mv to current dir" >> logfile.log

# batch of concurrent commands. Create TmpDir to clone repo into, strip out .git from that repo, copy to the dir command was run in
(mkdir ~/tmpDir && cd ~/tmpDir && git clone $repoURLToCloneAndStripGit $newRepoName && cd $newRepoName && rm -rf .git && git init && git add . && git commit -m "Initial Commit")

# getting the now current Dir (i think haha).
currPath=`pwd`

# Copying the repo to the destination dir with echo to show user were the script reached
cp -R ~/tmpDir/${newRepoName} ${destinationDir}
echo "created tempDir, then cloned the repo, and then removed the git history, and then mv everything from the temp dir to current one" >> logfile.log

# teardown the temp repo
rm -rf ~/tmpDir
echo "removed the temp directory" >> logfile.log

echo "Finished Successfully" >> logfile.log
rm logfile.log

echo "-"
echo "--"
echo "---"
echo "----"
echo "-----"
echo "------"
echo "-------"
echo "--------"
echo "---------"
echo "Finished successfully"
