FROM perl:5.36-slim-buster

WORKDIR /app

COPY cpanfile .
RUN cpm install

ADD . .

EXPOSE 3000

CMD ["perl", "-I", "local/lib/perl5", "app.pl"]
