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

NOTE:
Testing is performed on Mac-OSX instances only, since for other free-operating
systems there are better methods
(i.e. the [pretest VM images](http://pretest.nongnu.org/downloads/).


## Legal

Copyright (C) 2016 Assaf Gordon <assafgordon@gmail.com>

License: BSD-2-Clause
