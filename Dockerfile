FROM alpine:latest

# Create a script that echoes the GitHub secret
RUN echo '#!/bin/sh' > /test-script.sh && \
    echo 'echo "GitHub Secret: $MY_SECRET"' >> /test-script.sh && \
    chmod +x /test-script.sh

# Copy your application files
COPY . /app

# Set the environment variable
ENV MY_SECRET=$MY_SECRET
# Run the test script during the build
RUN /test-script.sh

# Run the test script
CMD ["/test-script.sh"]
