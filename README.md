# pretest-macos-runs

This little repository triggers build test of new tarballs using
Travis-CI's infrastructure.

Usage:

    $ ./setup-new-pretest-run.sh [TARBALL-URL]
    $ ./setup-new-pretest-run.sh http://ftp.gnu.org/gnu/hello/hello-2.9.tar.gz

Flow:

1.  The script updates the `.travis.yml` file, with the given URL, and
    pushes the updates to github.
2.  Travis-CI will pick-up the changes, and will spin testing instances
    to check the new tarball.
3.  Each Travis-CI instance downloads [Pretest](http://pretest.nongnu.org)'s
    [pretest-auto-build-check](http://git.savannah.gnu.org/cgit/pretest.git/plain/misc_scripts/pretest-auto-build-check)
    to download, build and test the new tarball.
4.  Logs from the build are uploaded to the pretest reports server
    (<https://pretest.housegordon.org>).
5.  Past results are available here:
    <https://travis-ci.org/agordon/pretest-macos-runs>

NOTE:
Testing is performed on Mac-OSX instances only, since for other free-operating
systems there are better methods
(i.e. the [pretest VM images](http://pretest.nongnu.org/downloads/).


To setup your own infrastructure:

1.  fork this repository on github <https://github.com/agordon/pretest-macos-runs>.
2.  Sign-up to Travis-CI <https://travis-ci.org/> and connect your GitHub account.
3.  In Travis-CI, add this new repository to the list of monitored repositories
    (so that any further commits will trigger a Travis-CI build).
4.  Clone the repository to your local computer.
5.  run `setup-new-pretest-run.sh` with a URL of a tarball to test.
    (The script will update the repository and push the changes to github).
6.  Travis-CI will pick-up the updates, and start the testing phase.
7.  When builds are complete, Travis will send you an email notification.
8.  (optionally) change the `REPORTURL` variable in the shell script to upload
    the build logs to a different PreTest report server.

## Legal

Copyright (C) 2016 Assaf Gordon <assafgordon@gmail.com>

License: BSD-2-Clause
