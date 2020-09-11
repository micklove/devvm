
# https://gist.github.com/micklove/aea7be1f27bffa9fcb05153e450095a2
# (nb: help:: with double :: allows users to override / extend)
help:: ## This help.
	@grep -E -h "^[a-zA-Z_-]+:.*?## " $(MAKEFILE_LIST) \
	  | sort \
	  | awk -v width=36 'BEGIN {FS = ":.*?## "} {printf "\033[36m%-*s\033[0m %s\n", width, $$1, $$2}'
