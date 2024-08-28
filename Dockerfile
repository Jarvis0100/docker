FROM python:3
# Set the working directory to /app
WORKDIR /app
# Copy the requirements.txt file into the Docker image
COPY requirements.txt .
# Install the Python dependencies with --no-cache to force the installation
RUN pip install --no-cache -r requirements.txt

# Copy the rest of the application into the Docker image
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Start the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
