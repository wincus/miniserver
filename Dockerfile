FROM scratch 

ENV CGO_ENABLED=0
ENV PORT=":8080"

ADD /build/miniserver-linux /

CMD ["/miniserver-linux"]
