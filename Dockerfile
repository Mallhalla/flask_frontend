# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Render uses to bind to
EXPOSE 10000

# Set environment variable to tell Flask to run on the correct port
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV PORT=10000

# Run Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=$PORT"]
