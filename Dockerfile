# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Render uses to bind to
EXPOSE 10000

# Set environment variables for Flask
ENV FLASK_APP=flask_server.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV PORT=10000
ENV FLASK_ENV=development 

# Run Flask app using exec to pass environment variables correctly
CMD ["flask", "run", "--host=0.0.0.0", "--port", "10000"]
