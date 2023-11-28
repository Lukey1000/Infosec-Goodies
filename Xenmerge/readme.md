This script takes an export managed devices csv from Xenmobile and:
1. Fixes the terrible date format.
2. Fixes the terrible iOS version format.
3. Fixes the fact that Xenmobile doesn't export an email address.
4. Culls the userlist to only those that have logged in within 30 days.
5. Exports them into a format that is ready for importing into a mail merge, so that you can email anyone without of date iOS that has logged in recently.

Why didn't I use python for this? This script is for a heavily locked down environment in which python is unavailable, and I wanted to learn how to do it with Powershell.

This works in my environment as of 2023, may need customisation for other environments, Xenmobile versions, etc.

