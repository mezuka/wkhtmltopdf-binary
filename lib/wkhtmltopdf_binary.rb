class WkhtmltopdfBinary
  def self.path
    @path ||= begin
      arch = case RUBY_PLATFORM
        when /64.*linux/
          'linux-amd64'
        when /linux/
          'linux-x86'
        when /darwin/
          'darwin-x86'
        else
          raise "Invalid platform. Must be running linux or intel-based Mac OS."
      end
      File.expand_path "#{File.dirname(__FILE__)}/../libexec/wkhtmltopdf-#{arch}"
    end
  end
end
