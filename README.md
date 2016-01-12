[![Build Status](https://travis-ci.org/mezuka/wkhtmltopdf-binary.svg?branch=master)](https://travis-ci.org/mezuka/wkhtmltopdf-binary)

This gems provides binaries for `wkhtmltopdf` library Qt patched version due to the
issue that official repositories contain only WebKit version that requires X server run.

## Installation

Insert the following into your `Gemfile`:

```ruby
gem 'wkhtmltopdf-binpath'
```

## Usage

In order to use it with `pdfkit` gem (for example) configure it in the following way:

```ruby
require 'wkhtmltopdf_binary'

PDFKit.configure do |config|
  config.wkhtmltopdf = WkhtmltopdfBinary.path
end

```

## Motivation

There are a lot of the same gems on [GitHub](https://github.com/search?utf8=%E2%9C%93&q=wkhtmltopdf_binary).
Why did we create one more?

- First of all, this one contains the latest working binaries for all popular operating systems.
- Secondly, it doesn't do any magic like others do. If you want to know where the suitable version of binary `wkhtmltopdf` file
for your operating system in current project just refer to the method `WkhtmltopdfBinary.path`.
- It doesn't break usage the installed `wkhtmltopdf` into your system. What means that it doesn't change executables `bundler`'s paths.
- And the last one point that it has tests.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
