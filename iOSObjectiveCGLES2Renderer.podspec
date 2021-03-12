Pod::Spec.new do |s|
  s.name         = 'iOSObjectiveCGLES2Renderer'
  s.version      = '2.0.0'
  s.summary      = 'iOSGLES2Renderer(iOSObjectiveC)'
  s.description  = 'ios renderer by OpenGLES2 and ObjectiveC.'
  s.homepage     = 'https://github.com/doasterisk/ios_renderer'
  s.license      = 'MIT'
  s.author             = { 'U-CREATES' => 'doasterisk.inc@gmail.com' }
  s.social_media_url   = 'https://twitter.com/doasterisk'
  s.platform     = :ios, '10.0'
  s.source       = { git: 'https://github.com/doasterisk/ios_renderer.git', branch: 'feature/opengles2' }
  s.source_files  = 'iOSObjectiveCGLES2Renderer/**/*.{c,h,m}'
  s.exclude_files = ''
end
