# WARNING!
#
# These modifications to os-release disable the bitbake parse
# cache (for the os-release recipe only).  Before copying
# and pasting into another recipe ensure it is understood
# what that means!

def run_git(d, cmd):
    try:
        oeroot = d.getVar('COREBASE', True)
        return bb.process.run("git --work-tree %s --git-dir %s/.git %s"
            % (oeroot, oeroot, cmd))[0].strip('\n')
    except:
        pass

python() {
    target_machine = d.getVar('MACHINE', True)
    if target_machine:
        d.setVar('OPENBMC_TARGET_MACHINE', target_machine)

    date_str = bb.process.run('date +"%Y%m%d"')[0].strip('\n')

    version_id = "hpe-" + target_machine + "-" + date_str

    git_description = run_git(d, 'describe --dirty --long')
    if git_description:
        git_list = git_description.split('-')
        git_list_len = len(git_list)
        if ("dirt" in git_description) and (git_list_len >= 3):
            version_id += "-" + git_list[git_list_len-3] + \
                          "-" + git_list[git_list_len-2] + \
                          "-" + git_list[git_list_len-1]
        else:
            version_id += "-" + git_list[git_list_len-2] + \
                          "-" + git_list[git_list_len-1]
        d.setVar('VERSION_ID', version_id)
        build_id = git_description
        d.setVar('BUILD_ID', build_id)
}

# Ensure the git commands run every time bitbake is invoked.
BB_DONT_CACHE = "1"

# Make os-release available to other recipes.
SYSROOT_DIRS_append = " ${sysconfdir}"
