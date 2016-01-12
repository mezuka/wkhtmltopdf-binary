require 'minitest'
require 'minitest/autorun'
require 'wkhtmltopdf_binary'

class WkhtmltopdfBinaryTest < Minitest::Test
  def test_returning_full_path
    set_platform('x86_64-darwin15.0') do
      assert_equal(WkhtmltopdfBinary.path,
        File.expand_path(
          File.join(File.dirname(__FILE__), '..', 'libexec', 'wkhtmltopdf-darwin-x86')))
    end
  end

  def test_with_known_arch_and_os
    set_platform('x86_64-linux') do
      assert_equal File.basename(WkhtmltopdfBinary.path), 'wkhtmltopdf-linux-x86_64'
    end
  end

  def test_with_known_arch_and_os_with_number
    set_platform('x86_64-linux2.0') do
      assert_equal File.basename(WkhtmltopdfBinary.path), 'wkhtmltopdf-linux-x86_64'
    end
  end

  def test_with_unknown_cpu_and_known_os
    set_platform('amd64-linux2.0') do
      assert_equal File.basename(WkhtmltopdfBinary.path), 'wkhtmltopdf-linux-x86'
    end
    set_platform('x86_64-darwin15.0') do
      assert_equal File.basename(WkhtmltopdfBinary.path), 'wkhtmltopdf-darwin-x86'
    end
  end

  def test_with_unknown_os
    set_platform('x86-windows') do
      assert_raises { File.basename(WkhtmltopdfBinary.path) }
    end
  end

  private

  def set_platform(platform)
    WkhtmltopdfBinary.instance_variable_set("@path", nil)
    orig_platform = WkhtmltopdfBinary.const_get('RUBY_PLATFORM')
    silence_warnings { WkhtmltopdfBinary.const_set('RUBY_PLATFORM', platform) }
    yield
  ensure
    silence_warnings { WkhtmltopdfBinary.const_set('RUBY_PLATFORM', orig_platform) }
  end

  def silence_warnings
    old_verbose, $VERBOSE = $VERBOSE, nil
    yield
  ensure
    $VERBOSE = old_verbose
  end
end
