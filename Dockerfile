FROM ruby:2.3.5

RUN apt-get update && \
    apt-get install -y net-tools && \
    apt-get install -y postgresql-client

# Install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN git clone https://github.com/EmitKiwi/talking-data $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Start server
ENV PORT 3000
EXPOSE 3000
#CMD ["bash"]
CMD ["ruby", "server.rb"]
