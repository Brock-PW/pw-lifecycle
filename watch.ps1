# watch.ps1 — Prevailing Wisdom lifecycle auto-pusher
# Watches the repo root AND channels/ subfolder for any .html changes
# Drop any file in either location → auto git add, commit, push → Netlify deploys

$repoPath = "C:\Users\brock\pw-lifecycle"

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $repoPath
$watcher.Filter = "*.html"
$watcher.IncludeSubdirectories = $true   # ← watches channels/ and any future subfolders
$watcher.EnableRaisingEvents = $true

$action = {
    $path = $Event.SourceEventArgs.FullPath
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType

    Write-Host ""
    Write-Host "[$([datetime]::Now.ToString('HH:mm:ss'))] Detected $changeType`: $name" -ForegroundColor Cyan

    Start-Sleep -Seconds 1   # brief pause to let the file finish writing

    Set-Location $repoPath

    git add -A
    $msg = "auto: update $name"
    git commit -m $msg
    git push origin main

    Write-Host "[$([datetime]::Now.ToString('HH:mm:ss'))] Pushed → Netlify deploying..." -ForegroundColor Green
}

Register-ObjectEvent $watcher "Created" -Action $action | Out-Null
Register-ObjectEvent $watcher "Changed" -Action $action | Out-Null

Write-Host ""
Write-Host "PW Lifecycle Watcher running" -ForegroundColor Yellow
Write-Host "Watching: $repoPath (including channels/ subfolder)" -ForegroundColor Yellow
Write-Host "Drop any .html file to auto-push. Press Ctrl+C to stop." -ForegroundColor Yellow
Write-Host ""

while ($true) { Start-Sleep -Seconds 1 }
