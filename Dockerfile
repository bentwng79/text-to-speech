# Use an official Python runtime as a parent image
FROM python:3.11.2-slim-buster

# Set the working directory
RUN mkdir -p /app
WORKDIR /app

# Copy the content of the current directory to the container
COPY . /app

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt && pip cache purge

# Expose the Flask port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
