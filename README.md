This gems provides binaries for `wkhtmltopdf` library Qt patched version due to the
issue that official repositories contain only WebKit version that requires X server run.


In order to use it with `pdfkit` gem (for example) configure it in the following way:

```ruby
require 'wkhtmltopdf_binary'

PDFKit.configure do |config|
  config.wkhtmltopdf = WkhtmltopdfBinary.path
end

```
