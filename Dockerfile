FROM ruby:2.6.5-slim

RUN apt-get update && \
    apt-get install -qq -y build-essential nodejs \
    libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV INSTALL_PATH /cafephilo_app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# The default command that gets ran will be to start the Puma server.
CMD ["rails", "server", "-b", "0.0.0.0"]
