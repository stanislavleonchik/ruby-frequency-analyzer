# Freq

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freq

## Usage
### initialize
Этот метод является конструктором класса и принимает три аргумента: `folder_path` - путь к папке, которая будет использоваться для анализа текстов; `stop_list` - список слов, которые будут исключены из анализа; `lemmatize` - флаг, который указывает, должна ли использоваться лемматизация.
В теле метода создаются переменные экземпляра: `@folder_path`, `@stop_list`, `@lemmatize` и `@word_counts`, которая представляет собой хэш, используемый для подсчета количества каждого слова в текстах. Параметр `stop_list` передается в конструктор как массив, из которого создается объект `Set`, чтобы исключить повторяющиеся элементы и ускорить поиск.
Использование этого метода позволяет создать новый объект класса для анализа текстов, при этом можно указать определенные параметры для анализа и исключения определенных слов из анализа.

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/freq. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Freq project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/freq/blob/master/CODE_OF_CONDUCT.md).
