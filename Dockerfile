FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY . .
RUN mkdir /usr/searchonastick 
WORKDIR /usr/searchonastick

#COPY Gemfile /usr/searchonastick/ 
#COPY Gemfile.lock /usr/searchonastick/ 

COPY . /usr/searchonastick
RUN gem install bundler
RUN gem build searchonastick.gemspec
RUN gem install searchonastick-0.1.0.gem
RUN bundle install

#CMD ["./bin/searchit"]
