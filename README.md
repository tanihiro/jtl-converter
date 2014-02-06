# JtlConverter

convert text and image results jmeter

## Installation

Add this line to your application's Gemfile:

    gem 'jtl-converter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jtl-converter

## Usage

convert text

    $ jtl-converter text jmeter.jtl
    Label   Samples Average Median  Min     Max     Error%  req/sec
    google_ 506     162     148     131     696     0.0     8
    yahoo_j 505     188     150     113     1374    0.0     8
    Total   1011    175     149     113     1374    0.0     16

convert image

    $ jtl-converter image jmeter.jtl --img_dir=img
    => img/elapsed.png, img/response_code.png, img/success.png

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
