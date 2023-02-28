FROM golang:1.19-alpine

WORKDIR /app

COPY ./Golang/go.mod ./
COPY ./Golang/go.sum ./
RUN go mod download

COPY ./Golang/*.go ./
COPY ./Golang/liveurls/*.go ./liveurls/

RUN go build -o /allinone

EXPOSE 35455

CMD [ "/allinone" ]