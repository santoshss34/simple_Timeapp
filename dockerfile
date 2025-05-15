FROM python:3.11-slim
RUN groupadd -r simpleuser && useradd -r -g simpleuser simpleuser

#  working directory
WORKDIR /app

# Copy the application
COPY app.py /app/

# Install required packages
RUN pip install --no-cache-dir flask

# Ensure correct permissions
RUN chown -R simpleuser:simpleuser /app

# Switch to non-root user
USER simpleuser

# Expose the port the app runs on
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
