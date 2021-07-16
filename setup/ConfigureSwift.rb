module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      keep_demo = "no".to_sym

      framework = "none".to_sym
      case framework
        when :quick
          configurator.add_pod_to_podfile "Quick', '~> 2.2.0"
          configurator.add_pod_to_podfile "Nimble', '~> 8.0.7"
          configurator.set_test_framework "quick", "swift", "swift"

        when :none
          configurator.set_test_framework "xctest", "swift", "swift"
      end

      snapshots = "no".to_sym
      case snapshots
        when :yes
          configurator.add_pod_to_podfile "FBSnapshotTestCase' , '~> 2.1.4"

          if keep_demo == :no
              puts " Putting demo application back in, you cannot do view tests without a host application."
              keep_demo = :yes
          end

          if framework == :quick
              configurator.add_pod_to_podfile "Nimble-Snapshots' , '~> 8.0.0"
          end
      end

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => ""
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Module/ReplaceMe.swift`

      `mv ./templates/swift/* ./`

      # remove podspec for osx
      `rm ./NAME-osx.podspec`
    end
  end

end
