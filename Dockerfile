# Use an official Python image from Docker Hub
FROM python:3.11-slim

# Set work directory inside the container
WORKDIR /app

# Copy app files into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Command to run the app
CMD ["python", "app.py"]

