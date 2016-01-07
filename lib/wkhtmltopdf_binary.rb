class WkhtmltopdfBinary
  def self.path
    @path ||= begin
      cpu, os = RUBY_PLATFORM.split('-', 2)
      os = case os
           when /linux/
             'linux'
           when /darwin/
             'darwin'
           else
             fail 'Invalid platform. Must be running linux or intel-based Mac OS.'
           end
      folder = File.join(File.dirname(__FILE__), '..', 'libexec')
      cpu = 'x86' if cpu != 'x86' && !File.file?(File.join(folder, "wkhtmltopdf-#{os}-#{cpu}"))
      File.expand_path(File.join(folder, "wkhtmltopdf-#{os}-#{cpu}"))
    end
  end
end
