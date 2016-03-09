def run_git(d, cmd):
        try:
                oeroot = d.getVar('COREBASE', True)
                return bb.process.run("git --git-dir %s/.git %s" %(oeroot, cmd))[0].strip('\n')
        except:
                pass

python() {
        version_id = run_git(d, 'describe --abbrev=0')
        if version_id:
		d.setVar('VERSION_ID', "6.10")
        build_id = run_git(d, 'describe --dirty')
        if build_id:
                d.setVar('BUILD_ID', build_id)
}

OS_RELEASE_FIELDS_append = " BUILD_ID"
do_compile[nostamp] = "1"
