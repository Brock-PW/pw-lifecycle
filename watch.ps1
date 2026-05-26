# Watches index.html and auto-commits + pushes to main on change
$repoPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$targetFile = "index.html"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $repoPath
$watcher.Filter = $targetFile
$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite
$watcher.EnableRaisingEvents = $true

Write-Host "Watching $targetFile for changes. Press Ctrl+C to stop."

while ($true) {
    $change = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::Changed, 500)

    if (-not $change.TimedOut) {
        # Debounce: wait for file to finish writing
        Start-Sleep -Milliseconds 800

        Write-Host "`n[$([datetime]::Now.ToString('HH:mm:ss'))] Change detected in $targetFile — committing..."

        Set-Location $repoPath
        git add $targetFile
        git commit -m "index.html updated via Claude.ai (auto-push)"
        git push origin main

        if ($?) {
            Write-Host "Pushed to main successfully."
        } else {
            Write-Host "Push failed — check credentials or network."
        }
    }
}
