# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory in the container to /app
WORKDIR /app

# Add the requirements.txt to the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Bundle the source
COPY . .

# Run migrations
RUN python manage.py migrate

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
