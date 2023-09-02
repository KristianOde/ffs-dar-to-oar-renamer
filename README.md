# ffs-dar-to-oar-renamer

A simple and probably bad bash script I made for personal use to rename the folders from [Full Folder Structure - Adaptive Movesets for MCO](https://www.nexusmods.com/skyrimspecialedition/mods/78727) to make it easier to use with OAR. You will have to have used [DAR to OAR converter](https://www.nexusmods.com/skyrimspecialedition/mods/93359) first.

It copies your folder, and then scans through the copied converted OAR folder and renames the folders within to something that is informative and easily sorted, as well as changing the name in every config file to benefit when using the in-game OAR overlay.
`9044100` will be renamed to `[9044100] - Mace - Expert - Dualwield`, as an example.
This should work for your existing FFS configuration and your animations will be copied over to the new folders. If you have added additional folders, for animations that use dTry's Key Utils or for any other purpose, then this will still be able to rename them as long as you've been using the recommended folder naming convention: `9191101` will be `[9191101] - Spear - Novice - Dualwield`. Any folders that don't have exactly 7 letters in their name will be moved to a backup folder, and folders that do have 7 letters in their name but don't follow the naming convention of FFS aren't going to have useful names.

Just navigate to your OAR-converted FFS directory and run the script. You need to have installed the jq package.
