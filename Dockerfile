FROM ruby:slim
WORKDIR /app
COPY . /app
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y nano
CMD ["ruby","mock.rb"]
EXPOSE 8888
