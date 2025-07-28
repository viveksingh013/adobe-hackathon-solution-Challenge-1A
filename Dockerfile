FROM --platform=linux/amd64 python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies for PDF processing
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the solution script
COPY solution.py .

# Set executable permissions
RUN chmod +x solution.py

# Set environment variables for better performance
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8

# Command to run the solution
CMD ["python", "solution.py"]
