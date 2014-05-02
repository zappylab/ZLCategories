Pod::Spec.new do |spec|
  spec.platform       = :ios, "7.0"
  spec.name           = 'ZLCategories'
  spec.version        = '0.1'
  spec.homepage       = 'https://github.com/Ilushkanama/ZLCategories'
  spec.authors        = { 'Ilya Dyakonov' => 'ilya@zappylab.com' }
  spec.summary        = 'Useful categories on UIKit/Foundation classes'
  spec.source         = { :git => 'https://github.com/zappylab/ZLCategories.git' }
  spec.source_files   = 'Categories/*.{h,m}'
  spec.requires_arc   = true
  spec.license        = 'MIT'
end