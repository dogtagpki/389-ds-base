# brand is lower case - used for names that don't appear to end users
# brand is used for file naming - should contain no spaces
brand=389
# capbrand is the properly capitalized brand name that appears to end users
# may contain spaces
capbrand=389
# vendor is the properly formatted vendor/manufacturer name that appears to end users
vendor="389 Project"

# PACKAGE_VERSION is constructed from these
VERSION_MAJOR=1
VERSION_MINOR=2
VERSION_MAINT=8.4
# if this is a PRERELEASE, set VERSION_PREREL
# otherwise, comment it out
# be sure to include the dot prefix in the prerel
#VERSION_PREREL=.rc5
# NOTES on VERSION_PREREL
# use aN for an alpha release e.g. a1, a2, etc.
# use rcN for a release candidate e.g. rc1, rc2, etc.
# for extra clarification, the date can be appended to the prerel e.g.
# RC1.`date +%Y%m%d`
# a git commit may also be used

if test -n "$VERSION_PREREL"; then
# if the source is from a git repo, put the last commit
# in the version
# if this is not a git repo, git log will say
#  fatal: Not a git repository
# to stderr and stdout will be empty
# this tells git to print the short commit hash from the last commit
    COMMIT=`cd $srcdir ; git log -1 --pretty=format:%h 2> /dev/null`
    if test -n "$COMMIT" ; then
        VERSION_PREREL=$VERSION_PREREL.git$COMMIT
    fi
fi

# the real version used throughout configure and make
# NOTE: because of autoconf/automake harshness, we cannot override the settings
# below in C code - there is no way to override the default #defines
# for these set with AC_INIT - so configure.ac should AC_DEFINE
# DS_PACKAGE_VERSION DS_PACKAGE_TARNAME DS_PACKAGE_BUGREPORT
# for use in C code - other code (perl scripts, shell scripts, Makefiles)
# can use PACKAGE_VERSION et. al.
PACKAGE_VERSION=$VERSION_MAJOR.$VERSION_MINOR.${VERSION_MAINT}$VERSION_PREREL
# the name of the source tarball - see make dist
PACKAGE_TARNAME=${brand}-ds-base
# url for bug reports
PACKAGE_BUGREPORT="${PACKAGE_BUGREPORT}enter_bug.cgi?product=$brand"
PACKAGE_STRING="$PACKAGE_TARNAME $PACKAGE_VERSION"
# the version of the ds console package that this directory server
# is compatible with
CONSOLE_VERSION=$VERSION_MAJOR.$VERSION_MINOR.5
