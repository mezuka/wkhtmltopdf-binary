class WkhtmltopdfBinary
  def self.path
    @path ||= begin
      cpu, os = RUBY_PLATFORM.split('-', 2)
      case os
      when /linux/
        os = 'linux'
      when /darwin/
        os = 'darwin'
      else
        raise "Invalid platform. Must be running linux or intel-based Mac OS."
      end
      path = "#{File.dirname(__FILE__)}/../libexec/"
      cpu = 'x86' if cpu != 'x86' && !File.file?("#{path}wkhtmltopdf-#{os}-#{cpu}")
      File.expand_path "#{path}wkhtmltopdf-#{os}-#{cpu}"
    end
  end
end

