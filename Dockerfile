# Use an official Python runtime as a parent image
FROM python:3.11.2-slim-buster

# Set the working directory
RUN mkdir -p /app
WORKDIR /app

# Install the Python dependencies
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the current directory to the container
COPY . /app

# Expose the Flask port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
