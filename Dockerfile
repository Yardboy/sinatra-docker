FROM aptible/ruby:2.6-ubuntu-16.04

RUN apt-get update -qq && \
    apt-get install -y \
      net-tools \
      vim \
      libfontconfig1 \
      libxrender1

# Set an environment variable to avoid repetition
ENV APP_HOME /var/www/app
ENV HOME /root

# Set the working directory
WORKDIR $APP_HOME

ENV BUNDLE_PATH /bundle

# Install gems
ADD Gemfile* $APP_HOME/
RUN bundle config --global silence_root_warning 1
RUN bundle install

# COPY app to container
ADD . $APP_HOME

# Start server
ENV PORT 3000
EXPOSE 3000
