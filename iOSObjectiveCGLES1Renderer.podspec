Pod::Spec.new do |s|
  s.name         = 'iOSObjectiveCGLES1Renderer'
  s.version      = '1.23.0'
  s.summary      = 'iOSGLES1Renderer(iOSObjectiveC)'
  s.description  = 'ios renderer by OpenGLES1 and ObjectiveC.'
  s.homepage     = 'https://github.com/ucreates/ios_renderer'
  s.license      = 'MIT'
  s.author             = { 'U-CREATES' => 'ucreates.inc@gmail.com' }
  s.social_media_url   = 'https://twitter.com/ucreates'
  s.platform     = :ios, '10.0'
  s.source       = { git: 'https://github.com/ucreates/ios_renderer.git', branch: 'master' }
  s.source_files  = 'iOSObjectiveCGLES1Renderer/**/*.{c,h,m}'
  s.exclude_files = ''
end
