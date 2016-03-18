# If you don't have swiftgen install it https://github.com/AliSoftware/SwiftGen
# brew update
# brew install swiftgen

swiftgen storyboards --output "Book Swap"/StoryboardsGen.swift  "Book Swap"/
swiftgen images --output "Book Swap"/ImagesGen.swift  "Book Swap"/
swiftgen strings --output "Book Swap"/StringsGen.swift  "Book Swap"/Base.lproj/Localizable.strings
swiftgen colors --output "Book Swap"/ColorsGen.swift  colors.txt
