project:
	xcodegen

format:
	swiftformat --header "© 2019 Ralf Ebert — CO2Rechner" --swiftversion 5 --indentcase true --stripunusedargs unnamed-only --self insert --disable blankLinesAtStartOfScope,blankLinesAtEndOfScope .

assets:
	# export icon
	sketchtool export slices CO2Rechner/Assets/AppIcon.sketch && mv Icon.png icon*.png CO2Rechner/Assets/Assets.xcassets/AppIcon.appiconset/
	# slice assets into xcassets - to install sketch-xcassets script:
	# curl https://gist.githubusercontent.com/ralfebert/2c350eea0e25deeaa44488d95e844965/raw/1b716d82a49f96849e859b3e378ed20c9f5b0ea3/slice.py -o /usr/local/bin/sketch-xcassets
	# chmod u+x /usr/local/bin/sketch-xcassets
	sketch-xcassets CO2Rechner/Assets/Assets.sketch CO2Rechner/Assets/Assets.xcassets
