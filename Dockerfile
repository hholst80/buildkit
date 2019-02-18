# syntax = docker/dockerfile:1.0-experimental
FROM ubuntu:18.04 as build
RUN echo "This is a test" > /testfile
FROM alpine:latest
RUN --mount=from=build,dst=/build ls -la /build > /contents-of-build && \
                                  cp /build/testfile /copy-of-testfile
CMD [ "cat", "/contents-of-build" ]
