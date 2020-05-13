FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && mkdir /fingers_sky

WORKDIR /fingers_sky

COPY Gemfile /fingers_sky/Gemfile

COPY Gemfile.lock /fingers_sky/Gemfile.lock

RUN bundle install

COPY . /fingers_sky

COPY docker/ruby/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
