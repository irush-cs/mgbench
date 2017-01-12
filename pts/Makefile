
default:
	@echo use \"make install\" to install all profiles
	@echo or copy them manually to "~/.phoronix-test-suite/test-{profiles,suites}/local"

install:

install: install-base
install-base:
	mkdir -vp ~/.phoronix-test-suite/test-profiles/local/mgbench-base
	cp -v mgbench-base/{downloads.xml,test-definition.xml,install.sh,results-definition.xml} ~/.phoronix-test-suite/test-profiles/local/mgbench-base
