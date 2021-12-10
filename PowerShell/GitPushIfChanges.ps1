

# Go to git repo directory
Set-Location U.DalilaDB
                    # uncommitted changes                                untracked files exist
if($(git status --porcelain |Where-Object {$_ -notmatch '^\?\?'}) -Or $(git status --porcelain |Where {$_ -match '^\?\?'})) {
    # uncommitted changes or untracked files exist
    Write-Host "Changes detected in <RepoName>, commiting"
    git add .
    $name = Read-Host 'Commit text'
    git commit -am $name
    git push
}
else {
    # tree is clean
    Write-Host "No changes to commit"
}
# Go to mext git repo directory
Set-Location ..

PAUSE