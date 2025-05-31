# Use official Ruby image as base
FROM ruby:3.2-slim

# Add metadata labels
LABEL maintainer="String Calculator TDD Kata"
LABEL description="String Calculator implementation with RSpec tests"
LABEL version="1.0.0"

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install Ruby dependencies
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application
COPY . .

# Set the default command to run tests
CMD ["bundle", "exec", "rspec"]